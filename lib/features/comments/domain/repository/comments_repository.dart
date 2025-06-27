import 'package:post_clean_arch/features/comments/domain/entities/comments_entity.dart';

abstract class CommentsRepository {
  // Get Comments
  Future<List<CommentsEntity>> getComments();
}
