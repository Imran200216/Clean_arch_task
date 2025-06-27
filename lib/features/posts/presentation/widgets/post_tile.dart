import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final String postTile;
  final String postDescription;

  const PostTile({
    super.key,
    required this.postTile,
    required this.postDescription,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(postTile),
      subtitle: Text(postDescription),
    );
  }
}
