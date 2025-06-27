import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/users/data/datasources/firebase_auth_datasource.dart';
import 'package:post_clean_arch/features/users/data/repository/user_repository_impl.dart';
import 'package:post_clean_arch/features/users/domain/entities/user_entity.dart';
import 'package:post_clean_arch/features/users/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:post_clean_arch/features/users/domain/usecases/sign_up_with_email_password_usecase.dart';

@Injectable()
class AuthProvider extends ChangeNotifier {
  // UseCases
  final SignUpWithEmailPasswordUseCase _signUpUseCase;
  final SignInWithEmailPasswordUseCase _signInUseCase;

  UserEntity? _currentUser;
  String? _error;
  bool _isLoading = false;

  // Getters
  UserEntity? get currentUser => _currentUser;
  String? get error => _error;
  bool get isLoading => _isLoading;

  // Constructor (with direct instantiation — consider injecting later via get_it)
  AuthProvider()
      : _signUpUseCase = SignUpWithEmailPasswordUseCase(
    userRepository: UserRepositoryImpl(
      firebaseAuthDataSource: FirebaseAuthDataSource(),
    ),
  ),
        _signInUseCase = SignInWithEmailPasswordUseCase(
          userRepository: UserRepositoryImpl(
            firebaseAuthDataSource: FirebaseAuthDataSource(),
          ),
        );

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Sign Up
  Future<void> signUp(String email, String password, String displayName) async {
    try {
      _setLoading(true);
      _error = null;
      _currentUser = await _signUpUseCase(email, password, displayName);
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  // Sign In
  Future<void> signIn(String email, String password) async {
    try {
      _setLoading(true);
      _error = null;
      _currentUser = await _signInUseCase(email, password);
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }
}
