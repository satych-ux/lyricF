// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LyricSectionModelImpl _$$LyricSectionModelImplFromJson(
  Map<String, dynamic> json,
) => _$LyricSectionModelImpl(
  title: json['title'] as String,
  lines: (json['lines'] as List<dynamic>).map((e) => e as String).toList(),
  isHighlight: json['isHighlight'] as bool? ?? false,
);

Map<String, dynamic> _$$LyricSectionModelImplToJson(
  _$LyricSectionModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'lines': instance.lines,
  'isHighlight': instance.isHighlight,
};

_$LyricModelImpl _$$LyricModelImplFromJson(Map<String, dynamic> json) =>
    _$LyricModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => LyricSectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LyricModelImplToJson(_$LyricModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sections': instance.sections,
    };
