import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final String postTile;
  final String postDescription;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  const PostTile({
    super.key,
    required this.postTile,
    required this.postDescription,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          onEditTap();
        },
        icon: Icon(Icons.edit),
      ),
      trailing: IconButton(
        onPressed: () {
          onDeleteTap();
        },
        icon: Icon(Icons.delete),
      ),

      title: Text(postTile),
      subtitle: Text(postDescription),
    );
  }
}
