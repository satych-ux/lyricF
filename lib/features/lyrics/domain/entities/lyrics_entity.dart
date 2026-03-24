import 'package:equatable/equatable.dart';

class LyricsEntity extends Equatable {
  final String verse1;
  final String chorus;
  final String verse2;
  final double score;

  const LyricsEntity({
    required this.verse1,
    required this.chorus,
    required this.verse2,
    required this.score,
  });

  @override
  List<Object?> get props => [verse1, chorus, verse2, score];
}
