import 'package:flutter/material.dart';
import 'package:post_clean_arch/features/posts/presentation/screens/add_post_screen.dart';
import 'package:post_clean_arch/features/posts/presentation/widgets/post_tile.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddPostScreen();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return PostTile(
            postTile: "Namma Flutter",
            postDescription: "It is the flutter community",
          );
        },
      ),
    );
  }
}
