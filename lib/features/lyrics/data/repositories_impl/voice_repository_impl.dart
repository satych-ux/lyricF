import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../domain/repositories/voice_repository.dart';

class VoiceRepositoryImpl implements VoiceRepository {
  final AudioRecorder _recorder = AudioRecorder();
  final StreamController<double> _amplitudeController =
      StreamController<double>.broadcast();
  Timer? _amplitudeTimer;

  @override
  Stream<double> get amplitudeStream => _amplitudeController.stream;

  @override
  Future<bool> hasPermission() async {
    final status = await Permission.microphone.request();
    return status == PermissionStatus.granted;
  }

  @override
  Future<void> startRecording() async {
    if (await _recorder.hasPermission()) {
      final Directory tempDir = await getTemporaryDirectory();
      final String path = '${tempDir.path}/recording.m4a';

      const config = RecordConfig();
      await _recorder.start(config, path: path);

      _amplitudeTimer = Timer.periodic(const Duration(milliseconds: 100), (
        timer,
      ) async {
        final amplitude = await _recorder.getAmplitude();
        // Normalize amplitude for UI (0.0 to 1.0 roughly)
        // Amplitude.current is in dB, usually -160 to 0
        final normalized = (amplitude.current + 160) / 160;
        _amplitudeController.add(normalized.clamp(0.0, 1.0));
      });
    }
  }

  @override
  Future<String?> stopRecording() async {
    _amplitudeTimer?.cancel();
    final path = await _recorder.stop();
    return path;
  }

  @override
  Future<void> dispose() async {
    await _recorder.dispose();
    await _amplitudeController.close();
  }
}
