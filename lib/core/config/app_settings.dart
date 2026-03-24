class AppSettings {
  List<String> selectedLanguages = ["English"];
  String selectedMood = "Melancholy";
  bool isCreatorModeEnabled = true;
  double meterIntensity = 0.8;
  double metaphorDensity = 0.4;
  String selectedRhyme = "AABB";

  static final AppSettings _instance = AppSettings._internal();
  factory AppSettings() => _instance;
  AppSettings._internal();
}
