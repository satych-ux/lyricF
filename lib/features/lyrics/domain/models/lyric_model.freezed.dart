// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LyricSectionModel _$LyricSectionModelFromJson(Map<String, dynamic> json) {
  return _LyricSectionModel.fromJson(json);
}

/// @nodoc
mixin _$LyricSectionModel {
  String get title => throw _privateConstructorUsedError;
  List<String> get lines => throw _privateConstructorUsedError;
  bool get isHighlight => throw _privateConstructorUsedError;

  /// Serializes this LyricSectionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LyricSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LyricSectionModelCopyWith<LyricSectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricSectionModelCopyWith<$Res> {
  factory $LyricSectionModelCopyWith(
    LyricSectionModel value,
    $Res Function(LyricSectionModel) then,
  ) = _$LyricSectionModelCopyWithImpl<$Res, LyricSectionModel>;
  @useResult
  $Res call({String title, List<String> lines, bool isHighlight});
}

/// @nodoc
class _$LyricSectionModelCopyWithImpl<$Res, $Val extends LyricSectionModel>
    implements $LyricSectionModelCopyWith<$Res> {
  _$LyricSectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lines = null,
    Object? isHighlight = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            lines: null == lines
                ? _value.lines
                : lines // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isHighlight: null == isHighlight
                ? _value.isHighlight
                : isHighlight // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LyricSectionModelImplCopyWith<$Res>
    implements $LyricSectionModelCopyWith<$Res> {
  factory _$$LyricSectionModelImplCopyWith(
    _$LyricSectionModelImpl value,
    $Res Function(_$LyricSectionModelImpl) then,
  ) = __$$LyricSectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<String> lines, bool isHighlight});
}

/// @nodoc
class __$$LyricSectionModelImplCopyWithImpl<$Res>
    extends _$LyricSectionModelCopyWithImpl<$Res, _$LyricSectionModelImpl>
    implements _$$LyricSectionModelImplCopyWith<$Res> {
  __$$LyricSectionModelImplCopyWithImpl(
    _$LyricSectionModelImpl _value,
    $Res Function(_$LyricSectionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LyricSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lines = null,
    Object? isHighlight = null,
  }) {
    return _then(
      _$LyricSectionModelImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        lines: null == lines
            ? _value._lines
            : lines // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isHighlight: null == isHighlight
            ? _value.isHighlight
            : isHighlight // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LyricSectionModelImpl implements _LyricSectionModel {
  const _$LyricSectionModelImpl({
    required this.title,
    required final List<String> lines,
    this.isHighlight = false,
  }) : _lines = lines;

  factory _$LyricSectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricSectionModelImplFromJson(json);

  @override
  final String title;
  final List<String> _lines;
  @override
  List<String> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  @JsonKey()
  final bool isHighlight;

  @override
  String toString() {
    return 'LyricSectionModel(title: $title, lines: $lines, isHighlight: $isHighlight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricSectionModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            (identical(other.isHighlight, isHighlight) ||
                other.isHighlight == isHighlight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    const DeepCollectionEquality().hash(_lines),
    isHighlight,
  );

  /// Create a copy of LyricSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricSectionModelImplCopyWith<_$LyricSectionModelImpl> get copyWith =>
      __$$LyricSectionModelImplCopyWithImpl<_$LyricSectionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricSectionModelImplToJson(this);
  }
}

abstract class _LyricSectionModel implements LyricSectionModel {
  const factory _LyricSectionModel({
    required final String title,
    required final List<String> lines,
    final bool isHighlight,
  }) = _$LyricSectionModelImpl;

  factory _LyricSectionModel.fromJson(Map<String, dynamic> json) =
      _$LyricSectionModelImpl.fromJson;

  @override
  String get title;
  @override
  List<String> get lines;
  @override
  bool get isHighlight;

  /// Create a copy of LyricSectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricSectionModelImplCopyWith<_$LyricSectionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LyricModel _$LyricModelFromJson(Map<String, dynamic> json) {
  return _LyricModel.fromJson(json);
}

/// @nodoc
mixin _$LyricModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<LyricSectionModel> get sections => throw _privateConstructorUsedError;

  /// Serializes this LyricModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LyricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LyricModelCopyWith<LyricModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricModelCopyWith<$Res> {
  factory $LyricModelCopyWith(
    LyricModel value,
    $Res Function(LyricModel) then,
  ) = _$LyricModelCopyWithImpl<$Res, LyricModel>;
  @useResult
  $Res call({String id, String title, List<LyricSectionModel> sections});
}

/// @nodoc
class _$LyricModelCopyWithImpl<$Res, $Val extends LyricModel>
    implements $LyricModelCopyWith<$Res> {
  _$LyricModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? sections = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            sections: null == sections
                ? _value.sections
                : sections // ignore: cast_nullable_to_non_nullable
                      as List<LyricSectionModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LyricModelImplCopyWith<$Res>
    implements $LyricModelCopyWith<$Res> {
  factory _$$LyricModelImplCopyWith(
    _$LyricModelImpl value,
    $Res Function(_$LyricModelImpl) then,
  ) = __$$LyricModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, List<LyricSectionModel> sections});
}

/// @nodoc
class __$$LyricModelImplCopyWithImpl<$Res>
    extends _$LyricModelCopyWithImpl<$Res, _$LyricModelImpl>
    implements _$$LyricModelImplCopyWith<$Res> {
  __$$LyricModelImplCopyWithImpl(
    _$LyricModelImpl _value,
    $Res Function(_$LyricModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LyricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? sections = null,
  }) {
    return _then(
      _$LyricModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        sections: null == sections
            ? _value._sections
            : sections // ignore: cast_nullable_to_non_nullable
                  as List<LyricSectionModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LyricModelImpl implements _LyricModel {
  const _$LyricModelImpl({
    required this.id,
    required this.title,
    required final List<LyricSectionModel> sections,
  }) : _sections = sections;

  factory _$LyricModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<LyricSectionModel> _sections;
  @override
  List<LyricSectionModel> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'LyricModel(id: $id, title: $title, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    const DeepCollectionEquality().hash(_sections),
  );

  /// Create a copy of LyricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricModelImplCopyWith<_$LyricModelImpl> get copyWith =>
      __$$LyricModelImplCopyWithImpl<_$LyricModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricModelImplToJson(this);
  }
}

abstract class _LyricModel implements LyricModel {
  const factory _LyricModel({
    required final String id,
    required final String title,
    required final List<LyricSectionModel> sections,
  }) = _$LyricModelImpl;

  factory _LyricModel.fromJson(Map<String, dynamic> json) =
      _$LyricModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<LyricSectionModel> get sections;

  /// Create a copy of LyricModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricModelImplCopyWith<_$LyricModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
