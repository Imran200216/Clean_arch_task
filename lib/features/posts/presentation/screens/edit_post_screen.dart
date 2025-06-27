import 'package:code_nest_ui/code_nest_ui.dart';
import 'package:flutter/material.dart';
import 'package:post_clean_arch/features/posts/domain/entities/post_entity.dart';

class EditPostScreen extends StatefulWidget {
  final PostEntity post;

  const EditPostScreen({super.key, required this.post});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  // Controllers
  final TextEditingController editPostTileController = TextEditingController();
  final TextEditingController editPostDescriptionController =
  TextEditingController();

  // Form key
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Post Title
              CodeNestTextFormField(

                hint: "Post Title",
                prefixIcon: Icons.title,
                validator: (value) {
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'Post Title is required';
                  }
                  return null;
                },
              ),

              // Post Description
              CodeNestTextFormField(

                hint: "Post Description",
                prefixIcon: Icons.description,
                validator: (value) {
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'Post Description is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 46,
                width: double.infinity,

                child: CodeNestFilledBtn(
                  label: "Edit Confirmed",
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
