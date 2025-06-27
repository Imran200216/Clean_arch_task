import 'package:flutter/material.dart';
import 'package:post_clean_arch/features/comments/presentation/provider/comments_provider.dart';
import 'package:post_clean_arch/features/comments/presentation/widgets/comments_list_tile.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  void initState() {
    super.initState();

    // Fetch comments on screen load
    Future.microtask(() =>
        Provider.of<CommentsProvider>(context, listen: false).fetchComments());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Comments")),
          body: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final comment = provider.comments[index];
                          return CommentsListTile(
                            body: comment.body ?? '',
                          );
                        },
                        childCount: provider.comments.length,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
