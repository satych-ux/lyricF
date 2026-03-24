import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiClient {
  static const String _apiKey = 'AIzaSyBfIfRGyaGtrUEvNTDL5JY9pZ_XlWLfcoU';

  static GenerativeModel get model => GenerativeModel(
    model: 'gemini-3-flash-preview',
    apiKey: _apiKey,
    generationConfig: GenerationConfig(responseMimeType: 'application/json'),
  );
}
