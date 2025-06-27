import 'package:flutter/material.dart';

class CommentsListTile extends StatelessWidget {
  final String body;

  const CommentsListTile({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50], // Light background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          body,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}
