import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/posts/data/datasources/firestore_post_datasource.dart';
import 'package:post_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:post_clean_arch/features/posts/domain/repository/post_repository.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final FirestorePostDataSource postDataSource;

  PostRepositoryImpl({required this.postDataSource});

  @override
  Future<PostEntity> addPost(String postTitle, String postDescription) {
    return postDataSource.addPost(postTitle, postDescription);
  }

  @override
  Future<void> deletePost(String postId) {
    return postDataSource.deletePost(postId);
  }

  @override
  Future<List<PostEntity>> readPost() {
    return postDataSource.readPosts();
  }

  @override
  Future<PostEntity> updatePost(
    String postTitle,
    String postDescription,
    String postId,
  ) {
    return postDataSource.updatePost(postId, postTitle, postDescription);
  }
}
