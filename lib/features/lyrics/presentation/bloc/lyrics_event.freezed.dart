// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyrics_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LyricsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function(String mood, List<String> languages)
    stopRecording,
    required TResult Function(double amplitude) updateAmplitude,
    required TResult Function(
      LyricsEntity currentLyrics,
      String enhancementType,
    )
    enhanceLyrics,
    required TResult Function(LyricsEntity lyrics, String mood, String language)
    openFromLibrary,
    required TResult Function() reset,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function(String mood, List<String> languages)? stopRecording,
    TResult? Function(double amplitude)? updateAmplitude,
    TResult? Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult? Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult? Function()? reset,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function(String mood, List<String> languages)? stopRecording,
    TResult Function(double amplitude)? updateAmplitude,
    TResult Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult Function()? reset,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateAmplitude value) updateAmplitude,
    required TResult Function(EnhanceLyrics value) enhanceLyrics,
    required TResult Function(OpenFromLibrary value) openFromLibrary,
    required TResult Function(Reset value) reset,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateAmplitude value)? updateAmplitude,
    TResult? Function(EnhanceLyrics value)? enhanceLyrics,
    TResult? Function(OpenFromLibrary value)? openFromLibrary,
    TResult? Function(Reset value)? reset,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateAmplitude value)? updateAmplitude,
    TResult Function(EnhanceLyrics value)? enhanceLyrics,
    TResult Function(OpenFromLibrary value)? openFromLibrary,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricsEventCopyWith<$Res> {
  factory $LyricsEventCopyWith(
    LyricsEvent value,
    $Res Function(LyricsEvent) then,
  ) = _$LyricsEventCopyWithImpl<$Res, LyricsEvent>;
}

/// @nodoc
class _$LyricsEventCopyWithImpl<$Res, $Val extends LyricsEvent>
    implements $LyricsEventCopyWith<$Res> {
  _$LyricsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartRecordingImplCopyWith<$Res> {
  factory _$$StartRecordingImplCopyWith(
    _$StartRecordingImpl value,
    $Res Function(_$StartRecordingImpl) then,
  ) = __$$StartRecordingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartRecordingImplCopyWithImpl<$Res>
    extends _$LyricsEventCopyWithImpl<$Res, _$StartRecordingImpl>
    implements _$$StartRecordingImplCopyWith<$Res> {
  __$$StartRecordingImplCopyWithImpl(
    _$StartRecordingImpl _value,
    $Res Function(_$StartRecordingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartRecordingImpl implements StartRecording {
  const _$StartRecordingImpl();

  @override
  String toString() {
    return 'LyricsEvent.startRecording()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartRecordingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function(String mood, List<String> languages)
    stopRecording,
    required TResult Function(double amplitude) updateAmplitude,
    required TResult Function(
      LyricsEntity currentLyrics,
      String enhancementType,
    )
    enhanceLyrics,
    required TResult Function(LyricsEntity lyrics, String mood, String language)
    openFromLibrary,
    required TResult Function() reset,
  }) {
    return startRecording();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function(String mood, List<String> languages)? stopRecording,
    TResult? Function(double amplitude)? updateAmplitude,
    TResult? Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult? Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult? Function()? reset,
  }) {
    return startRecording?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function(String mood, List<String> languages)? stopRecording,
    TResult Function(double amplitude)? updateAmplitude,
    TResult Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (startRecording != null) {
      return startRecording();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateAmplitude value) updateAmplitude,
    required TResult Function(EnhanceLyrics value) enhanceLyrics,
    required TResult Function(OpenFromLibrary value) openFromLibrary,
    required TResult Function(Reset value) reset,
  }) {
    return startRecording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateAmplitude value)? updateAmplitude,
    TResult? Function(EnhanceLyrics value)? enhanceLyrics,
    TResult? Function(OpenFromLibrary value)? openFromLibrary,
    TResult? Function(Reset value)? reset,
  }) {
    return startRecording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateAmplitude value)? updateAmplitude,
    TResult Function(EnhanceLyrics value)? enhanceLyrics,
    TResult Function(OpenFromLibrary value)? openFromLibrary,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (startRecording != null) {
      return startRecording(this);
    }
    return orElse();
  }
}

abstract class StartRecording implements LyricsEvent {
  const factory StartRecording() = _$StartRecordingImpl;
}

/// @nodoc
abstract class _$$StopRecordingImplCopyWith<$Res> {
  factory _$$StopRecordingImplCopyWith(
    _$StopRecordingImpl value,
    $Res Function(_$StopRecordingImpl) then,
  ) = __$$StopRecordingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mood, List<String> languages});
}

/// @nodoc
class __$$StopRecordingImplCopyWithImpl<$Res>
    extends _$LyricsEventCopyWithImpl<$Res, _$StopRecordingImpl>
    implements _$$StopRecordingImplCopyWith<$Res> {
  __$$StopRecordingImplCopyWithImpl(
    _$StopRecordingImpl _value,
    $Res Function(_$StopRecordingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mood = null, Object? languages = null}) {
    return _then(
      _$StopRecordingImpl(
        mood: null == mood
            ? _value.mood
            : mood // ignore: cast_nullable_to_non_nullable
                  as String,
        languages: null == languages
            ? _value._languages
            : languages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$StopRecordingImpl implements StopRecording {
  const _$StopRecordingImpl({
    required this.mood,
    required final List<String> languages,
  }) : _languages = languages;

  @override
  final String mood;
  final List<String> _languages;
  @override
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  String toString() {
    return 'LyricsEvent.stopRecording(mood: $mood, languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopRecordingImpl &&
            (identical(other.mood, mood) || other.mood == mood) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    mood,
    const DeepCollectionEquality().hash(_languages),
  );

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopRecordingImplCopyWith<_$StopRecordingImpl> get copyWith =>
      __$$StopRecordingImplCopyWithImpl<_$StopRecordingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function(String mood, List<String> languages)
    stopRecording,
    required TResult Function(double amplitude) updateAmplitude,
    required TResult Function(
      LyricsEntity currentLyrics,
      String enhancementType,
    )
    enhanceLyrics,
    required TResult Function(LyricsEntity lyrics, String mood, String language)
    openFromLibrary,
    required TResult Function() reset,
  }) {
    return stopRecording(mood, languages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function(String mood, List<String> languages)? stopRecording,
    TResult? Function(double amplitude)? updateAmplitude,
    TResult? Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult? Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult? Function()? reset,
  }) {
    return stopRecording?.call(mood, languages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function(String mood, List<String> languages)? stopRecording,
    TResult Function(double amplitude)? updateAmplitude,
    TResult Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (stopRecording != null) {
      return stopRecording(mood, languages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateAmplitude value) updateAmplitude,
    required TResult Function(EnhanceLyrics value) enhanceLyrics,
    required TResult Function(OpenFromLibrary value) openFromLibrary,
    required TResult Function(Reset value) reset,
  }) {
    return stopRecording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateAmplitude value)? updateAmplitude,
    TResult? Function(EnhanceLyrics value)? enhanceLyrics,
    TResult? Function(OpenFromLibrary value)? openFromLibrary,
    TResult? Function(Reset value)? reset,
  }) {
    return stopRecording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateAmplitude value)? updateAmplitude,
    TResult Function(EnhanceLyrics value)? enhanceLyrics,
    TResult Function(OpenFromLibrary value)? openFromLibrary,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (stopRecording != null) {
      return stopRecording(this);
    }
    return orElse();
  }
}

abstract class StopRecording implements LyricsEvent {
  const factory StopRecording({
    required final String mood,
    required final List<String> languages,
  }) = _$StopRecordingImpl;

  String get mood;
  List<String> get languages;

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopRecordingImplCopyWith<_$StopRecordingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAmplitudeImplCopyWith<$Res> {
  factory _$$UpdateAmplitudeImplCopyWith(
    _$UpdateAmplitudeImpl value,
    $Res Function(_$UpdateAmplitudeImpl) then,
  ) = __$$UpdateAmplitudeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double amplitude});
}

/// @nodoc
class __$$UpdateAmplitudeImplCopyWithImpl<$Res>
    extends _$LyricsEventCopyWithImpl<$Res, _$UpdateAmplitudeImpl>
    implements _$$UpdateAmplitudeImplCopyWith<$Res> {
  __$$UpdateAmplitudeImplCopyWithImpl(
    _$UpdateAmplitudeImpl _value,
    $Res Function(_$UpdateAmplitudeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amplitude = null}) {
    return _then(
      _$UpdateAmplitudeImpl(
        null == amplitude
            ? _value.amplitude
            : amplitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$UpdateAmplitudeImpl implements UpdateAmplitude {
  const _$UpdateAmplitudeImpl(this.amplitude);

  @override
  final double amplitude;

  @override
  String toString() {
    return 'LyricsEvent.updateAmplitude(amplitude: $amplitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAmplitudeImpl &&
            (identical(other.amplitude, amplitude) ||
                other.amplitude == amplitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amplitude);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAmplitudeImplCopyWith<_$UpdateAmplitudeImpl> get copyWith =>
      __$$UpdateAmplitudeImplCopyWithImpl<_$UpdateAmplitudeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function(String mood, List<String> languages)
    stopRecording,
    required TResult Function(double amplitude) updateAmplitude,
    required TResult Function(
      LyricsEntity currentLyrics,
      String enhancementType,
    )
    enhanceLyrics,
    required TResult Function(LyricsEntity lyrics, String mood, String language)
    openFromLibrary,
    required TResult Function() reset,
  }) {
    return updateAmplitude(amplitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function(String mood, List<String> languages)? stopRecording,
    TResult? Function(double amplitude)? updateAmplitude,
    TResult? Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult? Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult? Function()? reset,
  }) {
    return updateAmplitude?.call(amplitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function(String mood, List<String> languages)? stopRecording,
    TResult Function(double amplitude)? updateAmplitude,
    TResult Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (updateAmplitude != null) {
      return updateAmplitude(amplitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateAmplitude value) updateAmplitude,
    required TResult Function(EnhanceLyrics value) enhanceLyrics,
    required TResult Function(OpenFromLibrary value) openFromLibrary,
    required TResult Function(Reset value) reset,
  }) {
    return updateAmplitude(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateAmplitude value)? updateAmplitude,
    TResult? Function(EnhanceLyrics value)? enhanceLyrics,
    TResult? Function(OpenFromLibrary value)? openFromLibrary,
    TResult? Function(Reset value)? reset,
  }) {
    return updateAmplitude?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateAmplitude value)? updateAmplitude,
    TResult Function(EnhanceLyrics value)? enhanceLyrics,
    TResult Function(OpenFromLibrary value)? openFromLibrary,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (updateAmplitude != null) {
      return updateAmplitude(this);
    }
    return orElse();
  }
}

abstract class UpdateAmplitude implements LyricsEvent {
  const factory UpdateAmplitude(final double amplitude) = _$UpdateAmplitudeImpl;

  double get amplitude;

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAmplitudeImplCopyWith<_$UpdateAmplitudeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EnhanceLyricsImplCopyWith<$Res> {
  factory _$$EnhanceLyricsImplCopyWith(
    _$EnhanceLyricsImpl value,
    $Res Function(_$EnhanceLyricsImpl) then,
  ) = __$$EnhanceLyricsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LyricsEntity currentLyrics, String enhancementType});
}

/// @nodoc
class __$$EnhanceLyricsImplCopyWithImpl<$Res>
    extends _$LyricsEventCopyWithImpl<$Res, _$EnhanceLyricsImpl>
    implements _$$EnhanceLyricsImplCopyWith<$Res> {
  __$$EnhanceLyricsImplCopyWithImpl(
    _$EnhanceLyricsImpl _value,
    $Res Function(_$EnhanceLyricsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentLyrics = null, Object? enhancementType = null}) {
    return _then(
      _$EnhanceLyricsImpl(
        currentLyrics: null == currentLyrics
            ? _value.currentLyrics
            : currentLyrics // ignore: cast_nullable_to_non_nullable
                  as LyricsEntity,
        enhancementType: null == enhancementType
            ? _value.enhancementType
            : enhancementType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$EnhanceLyricsImpl implements EnhanceLyrics {
  const _$EnhanceLyricsImpl({
    required this.currentLyrics,
    required this.enhancementType,
  });

  @override
  final LyricsEntity currentLyrics;
  @override
  final String enhancementType;

  @override
  String toString() {
    return 'LyricsEvent.enhanceLyrics(currentLyrics: $currentLyrics, enhancementType: $enhancementType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnhanceLyricsImpl &&
            (identical(other.currentLyrics, currentLyrics) ||
                other.currentLyrics == currentLyrics) &&
            (identical(other.enhancementType, enhancementType) ||
                other.enhancementType == enhancementType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentLyrics, enhancementType);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnhanceLyricsImplCopyWith<_$EnhanceLyricsImpl> get copyWith =>
      __$$EnhanceLyricsImplCopyWithImpl<_$EnhanceLyricsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function(String mood, List<String> languages)
    stopRecording,
    required TResult Function(double amplitude) updateAmplitude,
    required TResult Function(
      LyricsEntity currentLyrics,
      String enhancementType,
    )
    enhanceLyrics,
    required TResult Function(LyricsEntity lyrics, String mood, String language)
    openFromLibrary,
    required TResult Function() reset,
  }) {
    return enhanceLyrics(currentLyrics, enhancementType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function(String mood, List<String> languages)? stopRecording,
    TResult? Function(double amplitude)? updateAmplitude,
    TResult? Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult? Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult? Function()? reset,
  }) {
    return enhanceLyrics?.call(currentLyrics, enhancementType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function(String mood, List<String> languages)? stopRecording,
    TResult Function(double amplitude)? updateAmplitude,
    TResult Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (enhanceLyrics != null) {
      return enhanceLyrics(currentLyrics, enhancementType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateAmplitude value) updateAmplitude,
    required TResult Function(EnhanceLyrics value) enhanceLyrics,
    required TResult Function(OpenFromLibrary value) openFromLibrary,
    required TResult Function(Reset value) reset,
  }) {
    return enhanceLyrics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateAmplitude value)? updateAmplitude,
    TResult? Function(EnhanceLyrics value)? enhanceLyrics,
    TResult? Function(OpenFromLibrary value)? openFromLibrary,
    TResult? Function(Reset value)? reset,
  }) {
    return enhanceLyrics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateAmplitude value)? updateAmplitude,
    TResult Function(EnhanceLyrics value)? enhanceLyrics,
    TResult Function(OpenFromLibrary value)? openFromLibrary,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (enhanceLyrics != null) {
      return enhanceLyrics(this);
    }
    return orElse();
  }
}

abstract class EnhanceLyrics implements LyricsEvent {
  const factory EnhanceLyrics({
    required final LyricsEntity currentLyrics,
    required final String enhancementType,
  }) = _$EnhanceLyricsImpl;

  LyricsEntity get currentLyrics;
  String get enhancementType;

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnhanceLyricsImplCopyWith<_$EnhanceLyricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenFromLibraryImplCopyWith<$Res> {
  factory _$$OpenFromLibraryImplCopyWith(
    _$OpenFromLibraryImpl value,
    $Res Function(_$OpenFromLibraryImpl) then,
  ) = __$$OpenFromLibraryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LyricsEntity lyrics, String mood, String language});
}

/// @nodoc
class __$$OpenFromLibraryImplCopyWithImpl<$Res>
    extends _$LyricsEventCopyWithImpl<$Res, _$OpenFromLibraryImpl>
    implements _$$OpenFromLibraryImplCopyWith<$Res> {
  __$$OpenFromLibraryImplCopyWithImpl(
    _$OpenFromLibraryImpl _value,
    $Res Function(_$OpenFromLibraryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lyrics = null,
    Object? mood = null,
    Object? language = null,
  }) {
    return _then(
      _$OpenFromLibraryImpl(
        lyrics: null == lyrics
            ? _value.lyrics
            : lyrics // ignore: cast_nullable_to_non_nullable
                  as LyricsEntity,
        mood: null == mood
            ? _value.mood
            : mood // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$OpenFromLibraryImpl implements OpenFromLibrary {
  const _$OpenFromLibraryImpl({
    required this.lyrics,
    required this.mood,
    required this.language,
  });

  @override
  final LyricsEntity lyrics;
  @override
  final String mood;
  @override
  final String language;

  @override
  String toString() {
    return 'LyricsEvent.openFromLibrary(lyrics: $lyrics, mood: $mood, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenFromLibraryImpl &&
            (identical(other.lyrics, lyrics) || other.lyrics == lyrics) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lyrics, mood, language);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenFromLibraryImplCopyWith<_$OpenFromLibraryImpl> get copyWith =>
      __$$OpenFromLibraryImplCopyWithImpl<_$OpenFromLibraryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function(String mood, List<String> languages)
    stopRecording,
    required TResult Function(double amplitude) updateAmplitude,
    required TResult Function(
      LyricsEntity currentLyrics,
      String enhancementType,
    )
    enhanceLyrics,
    required TResult Function(LyricsEntity lyrics, String mood, String language)
    openFromLibrary,
    required TResult Function() reset,
  }) {
    return openFromLibrary(lyrics, mood, language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function(String mood, List<String> languages)? stopRecording,
    TResult? Function(double amplitude)? updateAmplitude,
    TResult? Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult? Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult? Function()? reset,
  }) {
    return openFromLibrary?.call(lyrics, mood, language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function(String mood, List<String> languages)? stopRecording,
    TResult Function(double amplitude)? updateAmplitude,
    TResult Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (openFromLibrary != null) {
      return openFromLibrary(lyrics, mood, language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateAmplitude value) updateAmplitude,
    required TResult Function(EnhanceLyrics value) enhanceLyrics,
    required TResult Function(OpenFromLibrary value) openFromLibrary,
    required TResult Function(Reset value) reset,
  }) {
    return openFromLibrary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateAmplitude value)? updateAmplitude,
    TResult? Function(EnhanceLyrics value)? enhanceLyrics,
    TResult? Function(OpenFromLibrary value)? openFromLibrary,
    TResult? Function(Reset value)? reset,
  }) {
    return openFromLibrary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateAmplitude value)? updateAmplitude,
    TResult Function(EnhanceLyrics value)? enhanceLyrics,
    TResult Function(OpenFromLibrary value)? openFromLibrary,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (openFromLibrary != null) {
      return openFromLibrary(this);
    }
    return orElse();
  }
}

abstract class OpenFromLibrary implements LyricsEvent {
  const factory OpenFromLibrary({
    required final LyricsEntity lyrics,
    required final String mood,
    required final String language,
  }) = _$OpenFromLibraryImpl;

  LyricsEntity get lyrics;
  String get mood;
  String get language;

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenFromLibraryImplCopyWith<_$OpenFromLibraryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
    _$ResetImpl value,
    $Res Function(_$ResetImpl) then,
  ) = __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$LyricsEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
    _$ResetImpl _value,
    $Res Function(_$ResetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetImpl implements Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'LyricsEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function(String mood, List<String> languages)
    stopRecording,
    required TResult Function(double amplitude) updateAmplitude,
    required TResult Function(
      LyricsEntity currentLyrics,
      String enhancementType,
    )
    enhanceLyrics,
    required TResult Function(LyricsEntity lyrics, String mood, String language)
    openFromLibrary,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function(String mood, List<String> languages)? stopRecording,
    TResult? Function(double amplitude)? updateAmplitude,
    TResult? Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult? Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function(String mood, List<String> languages)? stopRecording,
    TResult Function(double amplitude)? updateAmplitude,
    TResult Function(LyricsEntity currentLyrics, String enhancementType)?
    enhanceLyrics,
    TResult Function(LyricsEntity lyrics, String mood, String language)?
    openFromLibrary,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateAmplitude value) updateAmplitude,
    required TResult Function(EnhanceLyrics value) enhanceLyrics,
    required TResult Function(OpenFromLibrary value) openFromLibrary,
    required TResult Function(Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateAmplitude value)? updateAmplitude,
    TResult? Function(EnhanceLyrics value)? enhanceLyrics,
    TResult? Function(OpenFromLibrary value)? openFromLibrary,
    TResult? Function(Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateAmplitude value)? updateAmplitude,
    TResult Function(EnhanceLyrics value)? enhanceLyrics,
    TResult Function(OpenFromLibrary value)? openFromLibrary,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class Reset implements LyricsEvent {
  const factory Reset() = _$ResetImpl;
}
