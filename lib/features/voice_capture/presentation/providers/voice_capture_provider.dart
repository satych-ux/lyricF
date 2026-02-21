import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/voice_state.dart';

part 'voice_capture_provider.g.dart';

/// [VoiceCaptureNotifier] manages the state of the voice recording process.
/// It uses Riverpod for reactive state management.
@riverpod
class VoiceCaptureNotifier extends _$VoiceCaptureNotifier {
  Timer? _timer;

  @override
  VoiceState build() {
    // Ensure timer is cancelled when provider is disposed
    ref.onDispose(() => _timer?.cancel());
    return const VoiceState();
  }

  void toggleRecording() {
    final isRecording = !state.isRecording;
    state = state.copyWith(isRecording: isRecording);

    if (isRecording) {
      _startTimer();
    } else {
      _stopTimer();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state.copyWith(recordingSeconds: state.recordingSeconds + 1);
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void setLanguage(String language) {
    state = state.copyWith(selectedLanguage: language);
  }

  void setMood(String mood) {
    state = state.copyWith(selectedMood: mood);
  }

  void reset() {
    _stopTimer();
    state = const VoiceState();
  }
}
