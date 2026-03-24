// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyrics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LyricsModel _$LyricsModelFromJson(Map<String, dynamic> json) {
  return _LyricsModel.fromJson(json);
}

/// @nodoc
mixin _$LyricsModel {
  String get verse1 => throw _privateConstructorUsedError;
  String get chorus => throw _privateConstructorUsedError;
  String get verse2 => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;

  /// Serializes this LyricsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LyricsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LyricsModelCopyWith<LyricsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricsModelCopyWith<$Res> {
  factory $LyricsModelCopyWith(
    LyricsModel value,
    $Res Function(LyricsModel) then,
  ) = _$LyricsModelCopyWithImpl<$Res, LyricsModel>;
  @useResult
  $Res call({String verse1, String chorus, String verse2, double score});
}

/// @nodoc
class _$LyricsModelCopyWithImpl<$Res, $Val extends LyricsModel>
    implements $LyricsModelCopyWith<$Res> {
  _$LyricsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verse1 = null,
    Object? chorus = null,
    Object? verse2 = null,
    Object? score = null,
  }) {
    return _then(
      _value.copyWith(
            verse1: null == verse1
                ? _value.verse1
                : verse1 // ignore: cast_nullable_to_non_nullable
                      as String,
            chorus: null == chorus
                ? _value.chorus
                : chorus // ignore: cast_nullable_to_non_nullable
                      as String,
            verse2: null == verse2
                ? _value.verse2
                : verse2 // ignore: cast_nullable_to_non_nullable
                      as String,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LyricsModelImplCopyWith<$Res>
    implements $LyricsModelCopyWith<$Res> {
  factory _$$LyricsModelImplCopyWith(
    _$LyricsModelImpl value,
    $Res Function(_$LyricsModelImpl) then,
  ) = __$$LyricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String verse1, String chorus, String verse2, double score});
}

/// @nodoc
class __$$LyricsModelImplCopyWithImpl<$Res>
    extends _$LyricsModelCopyWithImpl<$Res, _$LyricsModelImpl>
    implements _$$LyricsModelImplCopyWith<$Res> {
  __$$LyricsModelImplCopyWithImpl(
    _$LyricsModelImpl _value,
    $Res Function(_$LyricsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LyricsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verse1 = null,
    Object? chorus = null,
    Object? verse2 = null,
    Object? score = null,
  }) {
    return _then(
      _$LyricsModelImpl(
        verse1: null == verse1
            ? _value.verse1
            : verse1 // ignore: cast_nullable_to_non_nullable
                  as String,
        chorus: null == chorus
            ? _value.chorus
            : chorus // ignore: cast_nullable_to_non_nullable
                  as String,
        verse2: null == verse2
            ? _value.verse2
            : verse2 // ignore: cast_nullable_to_non_nullable
                  as String,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LyricsModelImpl extends _LyricsModel {
  const _$LyricsModelImpl({
    required this.verse1,
    required this.chorus,
    required this.verse2,
    required this.score,
  }) : super._();

  factory _$LyricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricsModelImplFromJson(json);

  @override
  final String verse1;
  @override
  final String chorus;
  @override
  final String verse2;
  @override
  final double score;

  @override
  String toString() {
    return 'LyricsModel(verse1: $verse1, chorus: $chorus, verse2: $verse2, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricsModelImpl &&
            (identical(other.verse1, verse1) || other.verse1 == verse1) &&
            (identical(other.chorus, chorus) || other.chorus == chorus) &&
            (identical(other.verse2, verse2) || other.verse2 == verse2) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, verse1, chorus, verse2, score);

  /// Create a copy of LyricsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricsModelImplCopyWith<_$LyricsModelImpl> get copyWith =>
      __$$LyricsModelImplCopyWithImpl<_$LyricsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricsModelImplToJson(this);
  }
}

abstract class _LyricsModel extends LyricsModel {
  const factory _LyricsModel({
    required final String verse1,
    required final String chorus,
    required final String verse2,
    required final double score,
  }) = _$LyricsModelImpl;
  const _LyricsModel._() : super._();

  factory _LyricsModel.fromJson(Map<String, dynamic> json) =
      _$LyricsModelImpl.fromJson;

  @override
  String get verse1;
  @override
  String get chorus;
  @override
  String get verse2;
  @override
  double get score;

  /// Create a copy of LyricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricsModelImplCopyWith<_$LyricsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
