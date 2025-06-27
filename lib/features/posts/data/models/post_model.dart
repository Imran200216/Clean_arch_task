import 'package:post_clean_arch/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.postTitle,
    required super.postDescription,
  });

  // ✅ From JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postTitle: json['postTitle'] as String,
      postDescription: json['postDescription'] as String,
    );
  }

  // ✅ To JSON
  Map<String, dynamic> toJson() {
    return {
      'postTitle': postTitle,
      'postDescription': postDescription,
    };
  }
}
