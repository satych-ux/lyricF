import '../entities/user_entity.dart';

abstract class AuthRepository {
  Stream<UserEntity?> get user;
  Future<UserEntity?> signInWithGoogle();
  Future<void> signOut();
}
