import 'package:flutter/material.dart';
import 'package:post_clean_arch/features/posts/presentation/providers/post_provider.dart';
import 'package:post_clean_arch/features/posts/presentation/screens/add_post_screen.dart';
import 'package:post_clean_arch/features/posts/presentation/screens/edit_post_screen.dart';
import 'package:post_clean_arch/features/posts/presentation/widgets/post_tile.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch posts once when widget builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().fetchPosts();
    });

    return Consumer<PostProvider>(
      builder: (context, postProvider, child) {
        final posts = postProvider.posts;

        return Scaffold(
          appBar: AppBar(title: const Text("Posts")),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddPostScreen()),
              );
            },
            child: const Icon(Icons.add),
          ),
          body: postProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : posts.isEmpty
              ? const Center(child: Text("No posts available"))
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostTile(
                      postTile: post.postTitle,
                      postDescription: post.postDescription,
                      onDeleteTap: () {
                        context.read<PostProvider>().deletePost(post.postId);
                      },
                      onEditTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPostScreen(post: post),
                          ),
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
