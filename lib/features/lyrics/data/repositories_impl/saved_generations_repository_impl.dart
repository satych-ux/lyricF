import '../../domain/entities/lyrics_entity.dart';
import '../../domain/repositories/saved_generations_repository.dart';
import '../datasource/saved_generations_datasource.dart';

class SavedGenerationsRepositoryImpl implements SavedGenerationsRepository {
  final SavedGenerationsDataSource dataSource;

  SavedGenerationsRepositoryImpl(this.dataSource);

  @override
  Future<void> saveGeneration({
    required String userId,
    required LyricsEntity lyrics,
    required String mood,
    required String language,
    String? enhancementType,
  }) {
    return dataSource.saveGeneration(
      userId: userId,
      lyrics: lyrics,
      mood: mood,
      language: language,
      enhancementType: enhancementType,
    );
  }

  @override
  Stream<List<Map<String, dynamic>>> getGenerations(String userId) {
    return dataSource.getGenerations(userId);
  }
}
