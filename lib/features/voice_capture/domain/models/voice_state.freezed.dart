// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VoiceState {
  bool get isRecording => throw _privateConstructorUsedError;
  int get recordingSeconds => throw _privateConstructorUsedError;
  String get selectedLanguage => throw _privateConstructorUsedError;
  String get selectedMood => throw _privateConstructorUsedError;

  /// Create a copy of VoiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceStateCopyWith<VoiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceStateCopyWith<$Res> {
  factory $VoiceStateCopyWith(
    VoiceState value,
    $Res Function(VoiceState) then,
  ) = _$VoiceStateCopyWithImpl<$Res, VoiceState>;
  @useResult
  $Res call({
    bool isRecording,
    int recordingSeconds,
    String selectedLanguage,
    String selectedMood,
  });
}

/// @nodoc
class _$VoiceStateCopyWithImpl<$Res, $Val extends VoiceState>
    implements $VoiceStateCopyWith<$Res> {
  _$VoiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? recordingSeconds = null,
    Object? selectedLanguage = null,
    Object? selectedMood = null,
  }) {
    return _then(
      _value.copyWith(
            isRecording: null == isRecording
                ? _value.isRecording
                : isRecording // ignore: cast_nullable_to_non_nullable
                      as bool,
            recordingSeconds: null == recordingSeconds
                ? _value.recordingSeconds
                : recordingSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            selectedLanguage: null == selectedLanguage
                ? _value.selectedLanguage
                : selectedLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedMood: null == selectedMood
                ? _value.selectedMood
                : selectedMood // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VoiceStateImplCopyWith<$Res>
    implements $VoiceStateCopyWith<$Res> {
  factory _$$VoiceStateImplCopyWith(
    _$VoiceStateImpl value,
    $Res Function(_$VoiceStateImpl) then,
  ) = __$$VoiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isRecording,
    int recordingSeconds,
    String selectedLanguage,
    String selectedMood,
  });
}

/// @nodoc
class __$$VoiceStateImplCopyWithImpl<$Res>
    extends _$VoiceStateCopyWithImpl<$Res, _$VoiceStateImpl>
    implements _$$VoiceStateImplCopyWith<$Res> {
  __$$VoiceStateImplCopyWithImpl(
    _$VoiceStateImpl _value,
    $Res Function(_$VoiceStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VoiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? recordingSeconds = null,
    Object? selectedLanguage = null,
    Object? selectedMood = null,
  }) {
    return _then(
      _$VoiceStateImpl(
        isRecording: null == isRecording
            ? _value.isRecording
            : isRecording // ignore: cast_nullable_to_non_nullable
                  as bool,
        recordingSeconds: null == recordingSeconds
            ? _value.recordingSeconds
            : recordingSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        selectedLanguage: null == selectedLanguage
            ? _value.selectedLanguage
            : selectedLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedMood: null == selectedMood
            ? _value.selectedMood
            : selectedMood // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$VoiceStateImpl implements _VoiceState {
  const _$VoiceStateImpl({
    this.isRecording = false,
    this.recordingSeconds = 45,
    this.selectedLanguage = "Hindi & English (Mix)",
    this.selectedMood = "Melancholy",
  });

  @override
  @JsonKey()
  final bool isRecording;
  @override
  @JsonKey()
  final int recordingSeconds;
  @override
  @JsonKey()
  final String selectedLanguage;
  @override
  @JsonKey()
  final String selectedMood;

  @override
  String toString() {
    return 'VoiceState(isRecording: $isRecording, recordingSeconds: $recordingSeconds, selectedLanguage: $selectedLanguage, selectedMood: $selectedMood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceStateImpl &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.recordingSeconds, recordingSeconds) ||
                other.recordingSeconds == recordingSeconds) &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage) &&
            (identical(other.selectedMood, selectedMood) ||
                other.selectedMood == selectedMood));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isRecording,
    recordingSeconds,
    selectedLanguage,
    selectedMood,
  );

  /// Create a copy of VoiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceStateImplCopyWith<_$VoiceStateImpl> get copyWith =>
      __$$VoiceStateImplCopyWithImpl<_$VoiceStateImpl>(this, _$identity);
}

abstract class _VoiceState implements VoiceState {
  const factory _VoiceState({
    final bool isRecording,
    final int recordingSeconds,
    final String selectedLanguage,
    final String selectedMood,
  }) = _$VoiceStateImpl;

  @override
  bool get isRecording;
  @override
  int get recordingSeconds;
  @override
  String get selectedLanguage;
  @override
  String get selectedMood;

  /// Create a copy of VoiceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceStateImplCopyWith<_$VoiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
