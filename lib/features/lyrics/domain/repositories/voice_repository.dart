abstract class VoiceRepository {
  Future<void> startRecording();
  Future<String?> stopRecording();
  Future<bool> hasPermission();
  Stream<double> get amplitudeStream;
  Future<void> dispose();
}
