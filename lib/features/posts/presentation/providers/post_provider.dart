import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:post_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:post_clean_arch/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:post_clean_arch/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:post_clean_arch/features/posts/domain/usecases/read_post_usecase.dart';
import 'package:post_clean_arch/features/posts/domain/usecases/update_post_usecase.dart';

@Injectable()
class PostProvider extends ChangeNotifier {
  final AddPostUseCase addPostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  final DeletePostUseCase deletePostUseCase;
  final ReadPostUseCase readPostUseCase;

  PostProvider({
    required this.addPostUseCase,
    required this.updatePostUseCase,
    required this.deletePostUseCase,
    required this.readPostUseCase,
  });

  List<PostEntity> _posts = [];
  bool _isLoading = false;
  String? _error;

  List<PostEntity> get posts => _posts;

  bool get isLoading => _isLoading;

  String? get error => _error;

  // 🔄 Fetch all posts
  Future<void> fetchPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _posts = await readPostUseCase();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  // ➕ Add post
  Future<void> addPost(String title, String description, postId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await addPostUseCase(title, description, postId);
      await fetchPosts(); // refresh
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  // ✏️ Update post
  Future<void> updatePost(
    String postId,
    String title,
    String description,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await updatePostUseCase(title, description, postId);
      await fetchPosts(); // refresh
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  // ❌ Delete post
  Future<void> deletePost(String postId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await deletePostUseCase(postId);
      await fetchPosts(); // refresh
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
