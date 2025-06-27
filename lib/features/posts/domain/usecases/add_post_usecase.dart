import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:post_clean_arch/features/posts/domain/repository/post_repository.dart';

@Injectable()
class AddPostUseCase {
  final PostRepository postRepository;

  AddPostUseCase({required this.postRepository});

  Future<PostEntity> call(
    String postTitle,
    String postDescription,
    String postId,
  ) {
    return postRepository.addPost(postTitle, postDescription, postId);
  }
}
