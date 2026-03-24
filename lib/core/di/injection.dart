import 'package:get_it/get_it.dart';
import 'package:lyric_flow/core/network/dio_client.dart';
import 'package:lyric_flow/features/lyrics/domain/repositories/lyrics_repository.dart';
import 'package:lyric_flow/features/lyrics/domain/repositories/voice_repository.dart';
import 'package:lyric_flow/features/lyrics/domain/repositories/stt_repository.dart';
import 'package:lyric_flow/features/lyrics/domain/usecases/generate_lyrics_usecase.dart';
import 'package:lyric_flow/features/lyrics/domain/usecases/enhance_lyrics_usecase.dart';
import 'package:lyric_flow/features/lyrics/data/datasource/lyrics_remote_datasource.dart';
import 'package:lyric_flow/features/lyrics/data/datasource/lyrics_remote_datasource_impl.dart';
import 'package:lyric_flow/features/lyrics/data/repositories_impl/lyrics_repository_impl.dart';
import 'package:lyric_flow/features/lyrics/data/repositories_impl/voice_repository_impl.dart';
import 'package:lyric_flow/features/lyrics/data/repositories_impl/stt_repository_impl.dart';
import 'package:lyric_flow/features/lyrics/presentation/bloc/lyrics_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lyric_flow/features/auth/domain/repositories/auth_repository.dart';
import 'package:lyric_flow/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:lyric_flow/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:lyric_flow/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lyric_flow/features/lyrics/domain/repositories/saved_generations_repository.dart';
import 'package:lyric_flow/features/lyrics/data/datasource/saved_generations_datasource.dart';
import 'package:lyric_flow/features/lyrics/data/repositories_impl/saved_generations_repository_impl.dart';
import 'package:lyric_flow/core/config/google_sign_in_config.dart';
import 'package:lyric_flow/core/services/elevenlabs_tts_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await GoogleSignIn.instance.initialize(
    serverClientId: kGoogleSignInServerClientId,
  );

  // Features - Lyrics
  // Bloc
  sl.registerFactory(
    () => LyricsBloc(
      generateLyricsUseCase: sl(),
      enhanceLyricsUseCase: sl(),
      voiceRepository: sl(),
      sttRepository: sl(),
      savedGenerationsRepository: sl(),
      firebaseAuth: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton(() => GenerateLyricsUseCase(sl()));
  sl.registerLazySingleton(() => EnhanceLyricsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<LyricsRepository>(() => LyricsRepositoryImpl(sl()));
  sl.registerLazySingleton<VoiceRepository>(() => VoiceRepositoryImpl());
  sl.registerLazySingleton<STTRepository>(() => STTRepositoryImpl());

  // Data sources
  sl.registerLazySingleton<LyricsRemoteDataSource>(
    () => LyricsRemoteDataSourceImpl(sl()),
  );

  // Features - Auth
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl(), sl()),
  );

  // Features - Saved Generations
  sl.registerLazySingleton<SavedGenerationsRepository>(
    () => SavedGenerationsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SavedGenerationsDataSource>(
    () => SavedGenerationsDataSourceImpl(sl()),
  );

  sl.registerLazySingleton(() => ElevenLabsTtsService());

  // External / Firebase
  sl.registerLazySingleton(() => DioClient.getInstance());
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => GoogleSignIn.instance);
}
