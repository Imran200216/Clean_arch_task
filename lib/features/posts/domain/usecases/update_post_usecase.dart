import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:post_clean_arch/features/posts/domain/repository/post_repository.dart';

@Injectable()
class UpdatePostUseCase {
  final PostRepository postRepository;

  UpdatePostUseCase({required this.postRepository});

  // Update post
  Future<PostEntity> call(
    String postTitle,
    String postDescription,
    String postId,
  ) {
    return postRepository.updatePost(postTitle, postDescription, postId);
  }
}
