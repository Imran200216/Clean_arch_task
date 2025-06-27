import 'package:post_clean_arch/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  // Add post
  Future<PostEntity> addPost(String postTitle, String postDescription);

  // Read post
  Future<List<PostEntity>> readPost();

  // Update post
  Future<PostEntity> updatePost(
    String postTitle,
    String postDescription,
    String postId,
  );

  // Delete post
  Future<void> deletePost(String postId);
}
