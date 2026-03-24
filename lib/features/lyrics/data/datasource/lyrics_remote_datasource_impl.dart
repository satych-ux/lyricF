import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lyric_flow/core/debug/ai_debug_log.dart';
import 'package:lyric_flow/core/network/gemini_client.dart';
import 'package:lyric_flow/features/lyrics/data/models/lyrics_model.dart';
import 'package:lyric_flow/features/lyrics/data/datasource/lyrics_remote_datasource.dart';

List<String> _cleanLanguages(List<String> languages) {
  final list = languages
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .toList();
  if (list.isEmpty) return ['English'];
  return list;
}

String _languageInstruction(List<String> lang) {
  if (lang.length == 1) {
    return 'Generate song lyrics in ${lang.first}';
  }
  return 'Generate song lyrics that naturally blend ${lang[0]} and ${lang[1]} '
      '(code-switching, bilingual lines, or a mixed style like Hinglish where it fits the idea)';
}

class LyricsRemoteDataSourceImpl implements LyricsRemoteDataSource {
  final Dio dio;

  LyricsRemoteDataSourceImpl(this.dio);

  @override
  Future<LyricsModel> generateLyrics({
    required String text,
    required String mood,
    required List<String> languages,
    String? rhymeScheme,
    double? intensityLevel,
  }) async {
    final lang = _cleanLanguages(languages);
    final prompt =
        '''
${_languageInstruction(lang)} based on the user's input: "$text".
The user explicitly selected these language(s) in the app (max 2): ${lang.join(', ')}.
The overall mood should be $mood.
${rhymeScheme != null ? "Follow this rhyme scheme: $rhymeScheme." : ""}
${intensityLevel != null ? "Intensity level (0-1): $intensityLevel." : ""}

Respond strictly with a JSON object containing:
- "verse1": A string with the first verse.
- "chorus": A string with the chorus.
- "verse2": A string with the second verse.
- "score": A double (0.0 to 10.0) representing the quality/relevance of the lyrics.

The response must be valid JSON and nothing else.
''';

    try {
      debugAiLog(
        '[Gemini generateLyrics] Inputs → model\n'
        '  text (user/STT): $text\n'
        '  mood: $mood\n'
        '  languages: $languages\n'
        '  rhymeScheme: $rhymeScheme\n'
        '  intensityLevel: $intensityLevel\n'
        '--- full prompt sent to Gemini ---\n$prompt',
      );

      final response = await GeminiClient.model.generateContent([
        Content.text(prompt),
      ]);

      final jsonString = response.text;
      if (jsonString == null) {
        throw Exception("Gemini returned empty response");
      }

      debugAiLog(
        '[Gemini generateLyrics] Raw response.text (JSON string)\n$jsonString',
      );

      final Map<String, dynamic> data = json.decode(jsonString);
      final model = LyricsModel.fromJson(data);
      debugAiLog(
        '[Gemini generateLyrics] Parsed LyricsModel\n'
        '  score: ${model.score}\n'
        '  verse1 (${model.verse1.length} chars)\n'
        '  chorus (${model.chorus.length} chars)\n'
        '  verse2 (${model.verse2.length} chars)\n'
        '  verse1: ${model.verse1}\n'
        '  chorus: ${model.chorus}\n'
        '  verse2: ${model.verse2}',
      );
      return model;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LyricsModel> enhanceLyrics({
    required LyricsModel currentLyrics,
    required String enhancementType,
  }) async {
    final prompt =
        '''
Enhance these lyrics while keeping the same structure:
Verse 1: ${currentLyrics.verse1}
Chorus: ${currentLyrics.chorus}
Verse 2: ${currentLyrics.verse2}

Application: Apply an "$enhancementType" effect.
- If "emotion", make it more emotionally resonant.
- If "poetic", use more metaphors and sophisticated language.
- If "urdu touch", incorporate Urdu words/metaphors or a Ghazal-like feel while keeping the primary language.

Respond strictly with a JSON object containing:
- "verse1": Enhanced version.
- "chorus": Enhanced version.
- "verse2": Enhanced version.
- "score": New score (0.0 to 10.0).

The response must be valid JSON and nothing else.
''';

    try {
      debugAiLog(
        '[Gemini enhanceLyrics] Inputs\n'
        '  enhancementType: $enhancementType\n'
        '--- full prompt sent to Gemini ---\n$prompt',
      );

      final response = await GeminiClient.model.generateContent([
        Content.text(prompt),
      ]);

      final jsonString = response.text;
      if (jsonString == null) {
        throw Exception("Gemini returned empty response");
      }

      debugAiLog(
        '[Gemini enhanceLyrics] Raw response.text (JSON string)\n$jsonString',
      );

      final Map<String, dynamic> data = json.decode(jsonString);
      final model = LyricsModel.fromJson(data);
      debugAiLog(
        '[Gemini enhanceLyrics] Parsed LyricsModel\n'
        '  score: ${model.score}\n'
        '  verse1: ${model.verse1}\n'
        '  chorus: ${model.chorus}\n'
        '  verse2: ${model.verse2}',
      );
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
