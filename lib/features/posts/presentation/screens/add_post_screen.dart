import 'package:flutter/material.dart';
import 'package:code_nest_ui/code_nest_ui.dart';
import 'package:post_clean_arch/features/posts/presentation/providers/post_provider.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  // Controllers
  final TextEditingController postTitleController = TextEditingController();
  final TextEditingController postDescriptionController =
      TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    postTitleController.dispose();
    postDescriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, postProvider, child) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Post Title Text Field
              TextField(
                controller: postTitleController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),

              // Post SubTitle Text Field
              TextField(
                controller: postDescriptionController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),

              // Add Post Btn
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    postProvider.addPost(
                      postTitleController.text.trim(),
                      postDescriptionController.text.trim(),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      CodeNestSuccessSnackBar(
                        message: "Message to be filled completely",
                      ),
                    );

                    postTitleController.clear();
                    postDescriptionController.clear();
                  } else {
                    // Failure toast
                    ScaffoldMessenger.of(context).showSnackBar(
                      CodeNestFailureSnackBar(
                        message: "Message to be filled completely",
                      ),
                    );
                  }
                },
                child: Text("Add Post"),
              ),
            ],
          ),
        );
      },
    );
  }
}
