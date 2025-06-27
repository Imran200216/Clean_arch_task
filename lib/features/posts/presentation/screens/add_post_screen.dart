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
  final TextEditingController postIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
          appBar: AppBar(centerTitle: true, title: Text("Post")),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Form(
              key: formKey,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Post Id
                  CodeNestTextFormField(
                    controller: postIdController,
                    hint: "Post Id",
                    prefixIcon: Icons.title,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Post Id is required';
                      }
                      return null;
                    },
                  ),

                  // Post Title Text Field
                  CodeNestTextFormField(
                    controller: postTitleController,
                    hint: "Post Title",
                    prefixIcon: Icons.title,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Post Id is required';
                      }
                      return null;
                    },
                  ),

                  // Post Description Text Field
                  CodeNestTextFormField(
                    controller: postDescriptionController,
                    hint: "Post Description",
                    prefixIcon: Icons.description,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Post Description is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // Add Post Btn
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: CodeNestFilledBtn(
                      isLoading: postProvider.isLoading,
                      label: "Add Post",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          postProvider.addPost(
                            postTitleController.text.trim(),
                            postDescriptionController.text.trim(),
                            postIdController.text.trim(),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            CodeNestSuccessSnackBar(
                              message: "Added Data to DB",
                            ),
                          );

                          postTitleController.clear();
                          postDescriptionController.clear();
                          postIdController.clear();
                        } else {
                          // Failure toast
                          ScaffoldMessenger.of(context).showSnackBar(
                            CodeNestFailureSnackBar(
                              message: "Message to be filled completely",
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
