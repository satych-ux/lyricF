import '../entities/lyrics_entity.dart';
import '../repositories/lyrics_repository.dart';

class GenerateLyricsUseCase {
  final LyricsRepository repository;

  GenerateLyricsUseCase(this.repository);

  Future<LyricsEntity> call({
    required String text,
    required String mood,
    required List<String> languages,
    String? rhymeScheme,
    double? intensityLevel,
  }) {
    return repository.generateLyrics(
      text: text,
      mood: mood,
      languages: languages,
      rhymeScheme: rhymeScheme,
      intensityLevel: intensityLevel,
    );
  }
}
