import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/posts/data/models/post_model.dart';

@LazySingleton()
class FirestorePostDataSource {
  // Collection name
  final CollectionReference collectionReference = FirebaseFirestore.instance
      .collection("posts");

  Future<PostModel> addPost(
    String postTitle,
    String postDescription,
    postId,
  ) async {
    final docRef = await collectionReference.add({
      "postId": postId,
      "postTitle": postTitle,
      "postDescription": postDescription,
      "createdAt": FieldValue.serverTimestamp(),
    });

    return PostModel(
      postTitle: postTitle,
      postDescription: postDescription,
      postId: postId,
    );
  }

  // Read posts
  Future<List<PostModel>> readPosts() async {
    final snapshot = await collectionReference.get();

    return snapshot.docs
        .map((doc) => PostModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // Update post
  Future<PostModel> updatePost(
    String postId,
    String title,
    String description,
  ) async {
    await collectionReference.doc(postId).update({
      "postTitle": title,
      "postDescription": description,
      "postId": postId,
    });

    return PostModel(
      postTitle: title,
      postDescription: description,
      postId: postId,
    );
  }

  // Delete Post
  Future<void> deletePost(String postId) async {
    await collectionReference.doc(postId).delete();
  }
}
