import '../models/lyrics_model.dart';

abstract class LyricsRemoteDataSource {
  Future<LyricsModel> generateLyrics({
    required String text,
    required String mood,
    required List<String> languages,
    String? rhymeScheme,
    double? intensityLevel,
  });

  Future<LyricsModel> enhanceLyrics({
    required LyricsModel currentLyrics,
    required String enhancementType,
  });
}
