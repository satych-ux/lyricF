// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creator_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CreatorSettings {
  double get meterIntensity => throw _privateConstructorUsedError;
  double get metaphorDensity => throw _privateConstructorUsedError;
  bool get isCreatorModeEnabled => throw _privateConstructorUsedError;

  /// Create a copy of CreatorSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatorSettingsCopyWith<CreatorSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatorSettingsCopyWith<$Res> {
  factory $CreatorSettingsCopyWith(
    CreatorSettings value,
    $Res Function(CreatorSettings) then,
  ) = _$CreatorSettingsCopyWithImpl<$Res, CreatorSettings>;
  @useResult
  $Res call({
    double meterIntensity,
    double metaphorDensity,
    bool isCreatorModeEnabled,
  });
}

/// @nodoc
class _$CreatorSettingsCopyWithImpl<$Res, $Val extends CreatorSettings>
    implements $CreatorSettingsCopyWith<$Res> {
  _$CreatorSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatorSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meterIntensity = null,
    Object? metaphorDensity = null,
    Object? isCreatorModeEnabled = null,
  }) {
    return _then(
      _value.copyWith(
            meterIntensity: null == meterIntensity
                ? _value.meterIntensity
                : meterIntensity // ignore: cast_nullable_to_non_nullable
                      as double,
            metaphorDensity: null == metaphorDensity
                ? _value.metaphorDensity
                : metaphorDensity // ignore: cast_nullable_to_non_nullable
                      as double,
            isCreatorModeEnabled: null == isCreatorModeEnabled
                ? _value.isCreatorModeEnabled
                : isCreatorModeEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreatorSettingsImplCopyWith<$Res>
    implements $CreatorSettingsCopyWith<$Res> {
  factory _$$CreatorSettingsImplCopyWith(
    _$CreatorSettingsImpl value,
    $Res Function(_$CreatorSettingsImpl) then,
  ) = __$$CreatorSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double meterIntensity,
    double metaphorDensity,
    bool isCreatorModeEnabled,
  });
}

/// @nodoc
class __$$CreatorSettingsImplCopyWithImpl<$Res>
    extends _$CreatorSettingsCopyWithImpl<$Res, _$CreatorSettingsImpl>
    implements _$$CreatorSettingsImplCopyWith<$Res> {
  __$$CreatorSettingsImplCopyWithImpl(
    _$CreatorSettingsImpl _value,
    $Res Function(_$CreatorSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatorSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meterIntensity = null,
    Object? metaphorDensity = null,
    Object? isCreatorModeEnabled = null,
  }) {
    return _then(
      _$CreatorSettingsImpl(
        meterIntensity: null == meterIntensity
            ? _value.meterIntensity
            : meterIntensity // ignore: cast_nullable_to_non_nullable
                  as double,
        metaphorDensity: null == metaphorDensity
            ? _value.metaphorDensity
            : metaphorDensity // ignore: cast_nullable_to_non_nullable
                  as double,
        isCreatorModeEnabled: null == isCreatorModeEnabled
            ? _value.isCreatorModeEnabled
            : isCreatorModeEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$CreatorSettingsImpl implements _CreatorSettings {
  const _$CreatorSettingsImpl({
    this.meterIntensity = 0.75,
    this.metaphorDensity = 0.45,
    this.isCreatorModeEnabled = true,
  });

  @override
  @JsonKey()
  final double meterIntensity;
  @override
  @JsonKey()
  final double metaphorDensity;
  @override
  @JsonKey()
  final bool isCreatorModeEnabled;

  @override
  String toString() {
    return 'CreatorSettings(meterIntensity: $meterIntensity, metaphorDensity: $metaphorDensity, isCreatorModeEnabled: $isCreatorModeEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatorSettingsImpl &&
            (identical(other.meterIntensity, meterIntensity) ||
                other.meterIntensity == meterIntensity) &&
            (identical(other.metaphorDensity, metaphorDensity) ||
                other.metaphorDensity == metaphorDensity) &&
            (identical(other.isCreatorModeEnabled, isCreatorModeEnabled) ||
                other.isCreatorModeEnabled == isCreatorModeEnabled));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    meterIntensity,
    metaphorDensity,
    isCreatorModeEnabled,
  );

  /// Create a copy of CreatorSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatorSettingsImplCopyWith<_$CreatorSettingsImpl> get copyWith =>
      __$$CreatorSettingsImplCopyWithImpl<_$CreatorSettingsImpl>(
        this,
        _$identity,
      );
}

abstract class _CreatorSettings implements CreatorSettings {
  const factory _CreatorSettings({
    final double meterIntensity,
    final double metaphorDensity,
    final bool isCreatorModeEnabled,
  }) = _$CreatorSettingsImpl;

  @override
  double get meterIntensity;
  @override
  double get metaphorDensity;
  @override
  bool get isCreatorModeEnabled;

  /// Create a copy of CreatorSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatorSettingsImplCopyWith<_$CreatorSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
