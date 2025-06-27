import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/users/domain/entities/user_entity.dart';
import 'package:post_clean_arch/features/users/data/models/user_model.dart';


@LazySingleton()
class FirebaseAuthDataSource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Sign Up With Email Password
  Future<UserEntity> signUpWithEmailPassword(
    String email,
    String password,
    String userName,
  ) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update the displayName after account creation
    await result.user!.updateDisplayName(userName);
    await result.user!.reload();
    final updatedUser = firebaseAuth.currentUser;

    // Now return your domain entity (or model)
    return UserModel(
      uid: updatedUser!.uid,
      email: updatedUser.email ?? '',
      userName: updatedUser.displayName ?? '',
    );
  }

  // Sign In With Email and Password
  Future<UserEntity> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;

    return UserModel(
      uid: user!.uid,
      email: user.email ?? '',
      userName: user.displayName ?? '',
    );
  }
}
