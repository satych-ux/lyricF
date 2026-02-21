import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/creator_settings.dart';

part 'creator_provider.g.dart';

@riverpod
class CreatorNotifier extends _$CreatorNotifier {
  @override
  CreatorSettings build() {
    return const CreatorSettings();
  }

  void setMeterIntensity(double value) {
    state = state.copyWith(meterIntensity: value);
  }

  void setMetaphorDensity(double value) {
    state = state.copyWith(metaphorDensity: value);
  }

  void toggleCreatorMode(bool value) {
    state = state.copyWith(isCreatorModeEnabled: value);
  }
}
