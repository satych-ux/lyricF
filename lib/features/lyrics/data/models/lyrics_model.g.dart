// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LyricsModelImpl _$$LyricsModelImplFromJson(Map<String, dynamic> json) =>
    _$LyricsModelImpl(
      verse1: json['verse1'] as String,
      chorus: json['chorus'] as String,
      verse2: json['verse2'] as String,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$LyricsModelImplToJson(_$LyricsModelImpl instance) =>
    <String, dynamic>{
      'verse1': instance.verse1,
      'chorus': instance.chorus,
      'verse2': instance.verse2,
      'score': instance.score,
    };
