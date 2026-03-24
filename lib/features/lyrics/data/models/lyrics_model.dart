import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/lyrics_entity.dart';

part 'lyrics_model.freezed.dart';
part 'lyrics_model.g.dart';

@freezed
class LyricsModel with _$LyricsModel {
  const factory LyricsModel({
    required String verse1,
    required String chorus,
    required String verse2,
    required double score,
  }) = _LyricsModel;

  factory LyricsModel.fromJson(Map<String, dynamic> json) =>
      _$LyricsModelFromJson(json);

  factory LyricsModel.fromEntity(LyricsEntity entity) => LyricsModel(
    verse1: entity.verse1,
    chorus: entity.chorus,
    verse2: entity.verse2,
    score: entity.score,
  );

  const LyricsModel._();

  LyricsEntity toEntity() => LyricsEntity(
    verse1: verse1,
    chorus: chorus,
    verse2: verse2,
    score: score,
  );
}
