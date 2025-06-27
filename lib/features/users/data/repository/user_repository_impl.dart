import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/users/data/datasources/firebase_auth_datasource.dart';
import 'package:post_clean_arch/features/users/domain/entities/user_entity.dart';
import 'package:post_clean_arch/features/users/domain/repository/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final FirebaseAuthDataSource firebaseAuthDataSource;

  UserRepositoryImpl({required this.firebaseAuthDataSource});

  // Sign in with email password
  @override
  Future<UserEntity> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    final user = await firebaseAuthDataSource.signInWithEmailPassword(
      email,
      password,
    );

    return UserEntity(
      uid: user.uid,
      email: user.email,
      userName: user.userName,
    );
  }

  // Sign up with email password
  @override
  Future<UserEntity> signUpWithEmailPassword(
    String email,
    String password,
    String userName,
  ) async {
    final user = await firebaseAuthDataSource.signUpWithEmailPassword(
      email,
      password,
      userName,
    );

    return UserEntity(
      uid: user.uid,
      email: user.email,
      userName: user.userName,
    );
  }
}
