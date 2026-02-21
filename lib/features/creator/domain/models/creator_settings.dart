import 'package:freezed_annotation/freezed_annotation.dart';

part 'creator_settings.freezed.dart';

@freezed
class CreatorSettings with _$CreatorSettings {
  const factory CreatorSettings({
    @Default(0.75) double meterIntensity,
    @Default(0.45) double metaphorDensity,
    @Default(true) bool isCreatorModeEnabled,
  }) = _CreatorSettings;
}
