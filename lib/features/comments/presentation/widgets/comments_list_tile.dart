import 'package:flutter/material.dart';

class CommentsListTile extends StatelessWidget {
  final String body;

  const CommentsListTile({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return ListTile(subtitle: Text(body));
  }
}
