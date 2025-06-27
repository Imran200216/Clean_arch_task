import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:post_clean_arch/features/posts/domain/repository/post_repository.dart';


@Injectable()
class ReadPostUseCase {
  final PostRepository postRepository;

  ReadPostUseCase({required this.postRepository});

  // Read post
  Future<List<PostEntity>> call(){
    return postRepository.readPost();
  }
}
