import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/users/domain/entities/user_entity.dart';
import 'package:post_clean_arch/features/users/domain/repository/user_repository.dart';


@Injectable()
class SignInWithEmailPasswordUseCase {
  final UserRepository userRepository;

  SignInWithEmailPasswordUseCase({required this.userRepository});


  Future<UserEntity> call(String email, String password) {
    return userRepository.signInWithEmailPassword(email, password);
  }
}
