import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:lyric_flow/core/config/elevenlabs_config.dart';

/// Calls ElevenLabs [text-to-speech](https://api.elevenlabs.io/v1/text-to-speech/{voice_id}).
class ElevenLabsTtsService {
  ElevenLabsTtsService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 30),
                receiveTimeout: const Duration(seconds: 120),
                sendTimeout: const Duration(seconds: 60),
              ),
            );

  final Dio _dio;

  /// [languageCode] e.g. `en`, `hi` — passed to API for normalization/pronunciation.
  Future<Uint8List> synthesizePoeticRead({
    required String text,
    required String languageCode,
    required bool useHindiVoice,
  }) async {
    if (!ElevenLabsConfig.hasApiKey) {
      throw StateError(
        'Missing ELEVENLABS_API_KEY. Run with '
        '--dart-define=ELEVENLABS_API_KEY=your_key',
      );
    }

    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('Text is empty');
    }

    final voiceId =
        useHindiVoice ? ElevenLabsConfig.voiceIdHindi : ElevenLabsConfig.voiceIdEnglish;

    final uri = Uri.parse(
      'https://api.elevenlabs.io/v1/text-to-speech/$voiceId',
    ).replace(
      queryParameters: {
        'output_format': 'mp3_44100_128',
        // 0 = best quality; higher values trade quality for latency.
        'optimize_streaming_latency': '0',
      },
    );

    const modelId = ElevenLabsConfig.ttsModelId;
    final textForApi = _prepareTextForModel(trimmed, modelId);

    final body = <String, dynamic>{
      'text': textForApi,
      'model_id': modelId,
      'language_code': languageCode,
      'voice_settings': _voiceSettingsForModel(modelId),
    };

    final response = await _dio.post<List<int>>(
      uri.toString(),
      data: body,
      options: Options(
        headers: {
          'xi-api-key': ElevenLabsConfig.apiKey,
          'Content-Type': 'application/json',
          'Accept': 'audio/mpeg',
        },
        responseType: ResponseType.bytes,
      ),
    );

    final code = response.statusCode ?? 0;
    if (code != 200 || response.data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'ElevenLabs TTS failed ($code)',
      );
    }

    return Uint8List.fromList(response.data!);
  }
}

/// v2: low stability + higher style = more cadence; slower [speed] for a lyrical read.
/// v3: tags handle some pacing; keep style moderate so it does not fight `[slows down]`.
Map<String, dynamic> _voiceSettingsForModel(String modelId) {
  final speed = _resolveSpeechSpeed(modelId);
  if (modelId == 'eleven_v3') {
    return {
      'stability': 0.30,
      'similarity_boost': 0.80,
      'style': 0.54,
      'use_speaker_boost': true,
      'speed': speed,
    };
  }
  return {
    'stability': 0.22,
    'similarity_boost': 0.76,
    'style': 0.68,
    'use_speaker_boost': true,
    'speed': speed,
  };
}

double _resolveSpeechSpeed(String modelId) {
  final raw = ElevenLabsConfig.ttsSpeedRaw.trim();
  if (raw.isNotEmpty) {
    final v = double.tryParse(raw);
    if (v != null && v >= 0.45 && v <= 1.25) {
      return v;
    }
  }
  return modelId == 'eleven_v3' ? 0.78 : 0.74;
}

/// [eleven_v3] interprets `[bracket]` phrases as performance cues, not spoken words.
String _prepareTextForModel(String text, String modelId) {
  final t = text.replaceAll(RegExp(r'\n{4,}'), '\n\n\n');
  if (modelId != 'eleven_v3') return t;
  if (t.trimLeft().startsWith('[')) return t;
  // v3: bracket tokens are director cues, not spoken (see ElevenLabs v3 audio tags docs).
  return '[reflective] [slows down]\n$t';
}

/// Short, user-facing copy for TTS failures (avoids dumping full [DioException] text).
String elevenLabsPlaybackUserMessage(Object error) {
  if (error is DioException) {
    final status = error.response?.statusCode;
    switch (status) {
      case 401:
        return 'ElevenLabs rejected the API key. Check ELEVENLABS_API_KEY.';
      case 402:
        return 'ElevenLabs needs credits or an active plan (402). '
            'Add billing or top up at elevenlabs.io, then try again.';
      case 403:
        return 'ElevenLabs blocked this request. Check your account access.';
      case 429:
        return 'Too many requests to ElevenLabs. Try again in a moment.';
      default:
        if (status != null && status >= 500) {
          return 'ElevenLabs is having issues. Try again later.';
        }
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Listen timed out. Check your connection and try again.';
      case DioExceptionType.connectionError:
        return 'No network. Check your connection and try again.';
      default:
        break;
    }
  }
  if (error is StateError) {
    return error.message;
  }
  if (error is ArgumentError) {
    return error.message ?? 'Invalid request for listen.';
  }
  return 'Could not play audio. Please try again.';
}
