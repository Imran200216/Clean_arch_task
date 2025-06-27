import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/comments/domain/entities/comments_entity.dart';
import 'package:post_clean_arch/features/comments/domain/repository/comments_repository.dart';

@LazySingleton()
class GetCommentsUsecase {
  final CommentsRepository commentsRepository;

  GetCommentsUsecase({required this.commentsRepository});

  Future<List<CommentsEntity>> call() async {
    return await commentsRepository.getComments();
  }
}
