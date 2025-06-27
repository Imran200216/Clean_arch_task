import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/posts/domain/repository/post_repository.dart';

@Injectable()
class DeletePostUseCase {
  final PostRepository postRepository;

  DeletePostUseCase({required this.postRepository});

  Future<void> call(String postId) {
    return postRepository.deletePost(postId);
  }
}

