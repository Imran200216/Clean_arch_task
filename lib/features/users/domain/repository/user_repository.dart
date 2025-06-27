import 'package:post_clean_arch/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  // Sign up with Email Password
  Future<UserEntity> signUpWithEmailPassword(
    String email,
    String password,
    String userName,
  );

  // Sign in with Email Password
  Future<UserEntity> signInWithEmailPassword(String email, String password);
}
