import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_state.freezed.dart';

@freezed
class VoiceState with _$VoiceState {
  const factory VoiceState({
    @Default(false) bool isRecording,
    @Default(45) int recordingSeconds,
    @Default("Hindi & English (Mix)") String selectedLanguage,
    @Default("Melancholy") String selectedMood,
  }) = _VoiceState;
}
