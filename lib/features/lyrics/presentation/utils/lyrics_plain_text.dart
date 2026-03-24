import 'package:lyric_flow/features/lyrics/domain/entities/lyrics_entity.dart';

/// Shared plain-text representation (copy, share).
String lyricsAsPlainText(LyricsEntity lyrics) {
  String section(String title, String body) => '$title\n${body.trim()}\n\n';
  return [
    section('VERSE 1', lyrics.verse1),
    section('CHORUS', lyrics.chorus),
    section('VERSE 2', lyrics.verse2),
  ].join().trim();
}

/// Lyrics for TTS: no spoken "VERSE 1" / "CHORUS" labels.
///
/// With [ttsModelId] `eleven_v3`, each block is prefixed with [audio tags] ElevenLabs treats as
/// delivery direction (not read aloud). Use v3 if you want verse vs chorus to feel different.
/// With `eleven_multilingual_v2`, tags are **not** injected (they could be spoken); sections are
/// only separated by blank lines for pauses.
String lyricsAsTtsPlaybackText(LyricsEntity lyrics, {required String ttsModelId}) {
  final v3 = ttsModelId == 'eleven_v3';
  final parts = <String>[];

  void addSection(String v3Cue, String body) {
    final t = body.trim();
    if (t.isEmpty) return;
    parts.add(v3 ? '$v3Cue\n$t' : t);
  }

  addSection('[thoughtful] [gentle]', lyrics.verse1);
  addSection('[emotional] [emphasized]', lyrics.chorus);
  addSection('[reflective] [soft]', lyrics.verse2);

  return parts.join('\n\n\n\n');
}
