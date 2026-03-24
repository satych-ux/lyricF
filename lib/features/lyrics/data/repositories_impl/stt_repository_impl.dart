import 'dart:io';
import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../domain/repositories/stt_repository.dart';
import 'package:lyric_flow/core/network/gemini_client.dart';

class STTRepositoryImpl implements STTRepository {
  @override
  Future<String> convertSpeechToText(String audioPath) async {
    try {
      final file = File(audioPath);
      if (!await file.exists()) {
        throw Exception("Audio file not found at $audioPath");
      }
      
      final bytes = await file.readAsBytes();
      
      // Determine mime type. The `record` package usually outputs .m4a
      String mimeType = 'audio/mp4';
      if (audioPath.toLowerCase().endsWith('.wav')) {
        mimeType = 'audio/wav';
      } else if (audioPath.toLowerCase().endsWith('.mp3')) {
        mimeType = 'audio/mp3';
      } else if (audioPath.toLowerCase().endsWith('.aac')) {
        mimeType = 'audio/aac';
      }

      final audioPart = DataPart(mimeType, bytes);
      final prompt = TextPart("Transcribe the following audio precisely. Return strictly a JSON object with a single key 'text' containing the transcribed string. No markdown or explanations outside the JSON.");

      // We use GeminiClient.model because it is pre-configured with the correct model 'gemini-3-flash-preview' and the API key.
      final response = await GeminiClient.model.generateContent([
        Content.multi([audioPart, prompt])
      ]);

      final jsonString = response.text;
      if (jsonString == null) {
         throw Exception("Gemini returned empty response for STT.");
      }
      
      final Map<String, dynamic> data = json.decode(jsonString);
      return data['text']?.toString().trim() ?? "Could not transcribe audio.";
    } catch (e) {
      throw Exception("Speech to text failed: $e");
    }
  }
}
