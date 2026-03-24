import '../entities/lyrics_entity.dart';

abstract class LyricsRepository {
  Future<LyricsEntity> generateLyrics({
    required String text,
    required String mood,
    required List<String> languages,
    String? rhymeScheme,
    double? intensityLevel,
  });

  Future<LyricsEntity> enhanceLyrics({
    required LyricsEntity currentLyrics,
    required String enhancementType,
  });
}
