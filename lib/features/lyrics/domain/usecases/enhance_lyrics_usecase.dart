import '../entities/lyrics_entity.dart';
import '../repositories/lyrics_repository.dart';

class EnhanceLyricsUseCase {
  final LyricsRepository repository;

  EnhanceLyricsUseCase(this.repository);

  Future<LyricsEntity> call({
    required LyricsEntity currentLyrics,
    required String enhancementType,
  }) {
    return repository.enhanceLyrics(
      currentLyrics: currentLyrics,
      enhancementType: enhancementType,
    );
  }
}
