import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/lyrics_entity.dart';

part 'lyrics_state.freezed.dart';

@freezed
class LyricsState with _$LyricsState {
  const factory LyricsState.initial() = Initial;
  const factory LyricsState.recording({@Default(0.0) double amplitude}) =
      Recording;
  const factory LyricsState.transcribing() = Transcribing;
  const factory LyricsState.generating() = Generating;
  const factory LyricsState.loaded(LyricsEntity lyrics) = Loaded;
  const factory LyricsState.enhancing(
    LyricsEntity currentLyrics,
    String enhancementType,
  ) = Enhancing;
  const factory LyricsState.error(String message) = Error;
}
