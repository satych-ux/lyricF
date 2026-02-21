import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/lyric_model.dart';

part 'lyrics_provider.g.dart';

@riverpod
class LyricsNotifier extends _$LyricsNotifier {
  @override
  Future<LyricModel> build() async {
    // Mocking a delay for API call
    await Future.delayed(const Duration(seconds: 2));

    return const LyricModel(
      id: '1',
      title: 'Midnight Whispers',
      sections: [
        LyricSectionModel(
          title: "VERSE 1",
          lines: [
            "The city lights are fading low,",
            "Where shadows dance and rivers flow.",
            "A whispered secret in the breeze,",
            "That rustles through the ancient trees.",
          ],
        ),
        LyricSectionModel(
          title: "CHORUS",
          isHighlight: true,
          lines: [
            "Oh, hold the night, don't let it go,",
            "In the silence, let the feelings grow.",
            "We are the sparks within the dark,",
            "Leaving traces, leaving a mark.",
          ],
        ),
        LyricSectionModel(
          title: "VERSE 2",
          lines: [
            "Walking down the street of dreams,",
            "Nothing's ever as it seems.",
            "The pavement echoes with our song,",
            "A melody where we belong.",
          ],
        ),
      ],
    );
  }

  void enhanceEmotion() {
    // Logic to update state with enhanced lyrics
  }

  void makePoetic() {
    // Logic to update state with poetic version
  }
}
