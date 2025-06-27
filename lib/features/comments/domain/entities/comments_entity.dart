import 'package:post_clean_arch/features/comments/data/models/user_model.dart';

class CommentsEntity {
  final int? id;
  final String? body;
  final int? postId;
  final int? likes;
  final UserModel? userEntity;

  CommentsEntity(this.id, this.body, this.postId, this.likes,  this.userEntity);
}
