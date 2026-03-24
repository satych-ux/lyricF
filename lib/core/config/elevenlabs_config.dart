/// ElevenLabs Text-to-Speech — [docs](https://elevenlabs.io/docs/api-reference/text-to-speech/convert).
///
/// **Do not ship your API key in source.** Pass at build time:
/// `flutter run --dart-define=ELEVENLABS_API_KEY=your_key`
///
/// Optional **voice_id** overrides — same ID the website uses for TTS (e.g. library voices like
/// “Anvi” for Hindi). In the app, the **English** Listen chip uses [ElevenLabsConfig.voiceIdEnglish]
/// and the **Hindi** chip uses [ElevenLabsConfig.voiceIdHindi].
///
/// Get the ID: [Voice Library](https://elevenlabs.io/app/voice-library) → open the voice → use
/// **Add to My Voices** if needed → open **Voice settings** / detail and copy **Voice ID**
/// (long alphanumeric string).
///
/// Full run (replace placeholders; line breaks optional):
/// ```sh
/// flutter run \
///   --dart-define=ELEVENLABS_API_KEY=YOUR_API_KEY \
///   --dart-define=ELEVENLABS_VOICE_EN=YOUR_ENGLISH_VOICE_ID \
///   --dart-define=ELEVENLABS_VOICE_HI=YOUR_HINDI_VOICE_ID
/// ```
///
/// Or use a JSON file (values must be strings):  
/// `flutter run --dart-define-from-file=tool/elevenlabs.dartdefines.json`  
/// Copy [tool/elevenlabs.dartdefines.json.example](tool/elevenlabs.dartdefines.json.example) →
/// `tool/elevenlabs.dartdefines.json` (gitignored) and fill in secrets.
///
/// **More expressive “read”:** pick a storytelling / emotive voice in the library (Rachel is
/// fairly neutral), and/or set:
/// `--dart-define=ELEVENLABS_TTS_MODEL=eleven_v3` — v3 supports inline `[audio tags]` for tone
/// and pacing (often higher latency than `eleven_multilingual_v2`). Playback uses different tags
/// for verse vs chorus so the model performs each block differently (tags are not spoken).
///
/// Optional slower read: `--dart-define=ELEVENLABS_TTS_SPEED=0.72` (roughly `0.5`–`1.2`; `1.0` = normal).
///
/// Default voice is ElevenLabs “Rachel” (works with [eleven_multilingual_v2] for EN/HI).
class ElevenLabsConfig {
  ElevenLabsConfig._();

  static const String apiKey = String.fromEnvironment('ELEVENLABS_API_KEY');

  static const String _defaultTtsModel = 'eleven_multilingual_v2';

  /// TTS model: `eleven_multilingual_v2` (default) or `eleven_v3` for stronger performance + tags.
  static const String ttsModelId = String.fromEnvironment(
    'ELEVENLABS_TTS_MODEL',
    defaultValue: _defaultTtsModel,
  );

  /// Optional override for speech speed; parsed in TTS if non-empty, range `0.45`–`1.25`.
  static const String ttsSpeedRaw = String.fromEnvironment(
    'ELEVENLABS_TTS_SPEED',
    defaultValue: '',
  );

  /// Premade “Rachel” — override per language from Voice Library if you want.
  static const String _defaultVoice = '21m00Tcm4TlvDq8ikWAM';

  static const String _voiceEnRaw = String.fromEnvironment(
    'ELEVENLABS_VOICE_EN',
    defaultValue: '',
  );

  static const String _voiceHiRaw = String.fromEnvironment(
    'ELEVENLABS_VOICE_HI',
    defaultValue: '',
  );

  /// English Listen chip → `ELEVENLABS_VOICE_EN` (falls back to Rachel if unset or blank).
  static String get voiceIdEnglish =>
      _voiceEnRaw.isEmpty ? _defaultVoice : _voiceEnRaw;

  /// Hindi Listen chip → `ELEVENLABS_VOICE_HI` (falls back to Rachel if unset or blank).
  static String get voiceIdHindi =>
      _voiceHiRaw.isEmpty ? _defaultVoice : _voiceHiRaw;

  static bool get hasApiKey => apiKey.isNotEmpty;
}
