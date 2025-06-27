import 'package:post_clean_arch/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.postId,
    required super.postTitle,
    required super.postDescription,
  });

  // ✅ From JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postId: json['postId'] as String,
      postTitle: json['postTitle'] as String,
      postDescription: json['postDescription'] as String,
    );
  }

  // ✅ To JSON
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'postTitle': postTitle,
      'postDescription': postDescription,
    };
  }
}
