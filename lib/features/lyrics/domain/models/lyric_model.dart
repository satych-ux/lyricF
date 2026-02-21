import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric_model.freezed.dart';
part 'lyric_model.g.dart';

@freezed
class LyricSectionModel with _$LyricSectionModel {
  const factory LyricSectionModel({
    required String title,
    required List<String> lines,
    @Default(false) bool isHighlight,
  }) = _LyricSectionModel;

  factory LyricSectionModel.fromJson(Map<String, dynamic> json) => _$LyricSectionModelFromJson(json);
}

@freezed
class LyricModel with _$LyricModel {
  const factory LyricModel({
    required String id,
    required String title,
    required List<LyricSectionModel> sections,
  }) = _LyricModel;

  factory LyricModel.fromJson(Map<String, dynamic> json) => _$LyricModelFromJson(json);
}
