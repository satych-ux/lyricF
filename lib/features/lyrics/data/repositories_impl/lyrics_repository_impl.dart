import '../../domain/entities/lyrics_entity.dart';
import '../../domain/repositories/lyrics_repository.dart';
import '../datasource/lyrics_remote_datasource.dart';
import '../models/lyrics_model.dart';

class LyricsRepositoryImpl implements LyricsRepository {
  final LyricsRemoteDataSource remoteDataSource;

  LyricsRepositoryImpl(this.remoteDataSource);

  @override
  Future<LyricsEntity> generateLyrics({
    required String text,
    required String mood,
    required List<String> languages,
    String? rhymeScheme,
    double? intensityLevel,
  }) async {
    final model = await remoteDataSource.generateLyrics(
      text: text,
      mood: mood,
      languages: languages,
      rhymeScheme: rhymeScheme,
      intensityLevel: intensityLevel,
    );
    return model.toEntity();
  }

  @override
  Future<LyricsEntity> enhanceLyrics({
    required LyricsEntity currentLyrics,
    required String enhancementType,
  }) async {
    final model = await remoteDataSource.enhanceLyrics(
      currentLyrics: LyricsModel.fromEntity(currentLyrics),
      enhancementType: enhancementType,
    );
    return model.toEntity();
  }
}
