import '../../domain/entities/lyrics_entity.dart';

abstract class SavedGenerationsRepository {
  Future<void> saveGeneration({
    required String userId,
    required LyricsEntity lyrics,
    required String mood,
    required String language,
    String? enhancementType,
  });

  Stream<List<Map<String, dynamic>>> getGenerations(String userId);
}
