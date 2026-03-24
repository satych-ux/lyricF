import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Stream<UserEntity?> get user {
    return remoteDataSource.userChanges.map((firebaseUser) {
      if (firebaseUser == null) return null;
      return UserEntity(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        name: firebaseUser.displayName,
        photoUrl: firebaseUser.photoURL,
      );
    });
  }

  @override
  Future<UserEntity?> signInWithGoogle() async {
    final firebaseUser = await remoteDataSource.signInWithGoogle();
    if (firebaseUser == null) return null;
    return UserEntity(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
    );
  }

  @override
  Future<void> signOut() {
    return remoteDataSource.signOut();
  }
}
