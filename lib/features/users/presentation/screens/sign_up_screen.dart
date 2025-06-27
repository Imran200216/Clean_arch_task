import 'package:code_nest_ui/code_nest_ui.dart';
import 'package:flutter/material.dart';
import 'package:post_clean_arch/features/comments/presentation/screens/comments_screen.dart';
import 'package:post_clean_arch/features/users/presentation/providers/auth_email_provider.dart';
import 'package:post_clean_arch/features/users/presentation/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      final authProvider = context.read<AuthProvider>();

      await authProvider.signUp(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _nameController.text.trim(),
      );

      if (authProvider.currentUser != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(CodeNestSuccessSnackBar(message: "Sign Up Successful!"));

        // comments Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CommentsScreen();
            },
          ),
        );

        _emailController.clear();
        _passwordController.clear();
        _nameController.clear();
      } else if (authProvider.error != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(CodeNestFailureSnackBar(message: authProvider.error!));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [
              // Name
              CodeNestTextFormField(
                validator: (value) => CodeNestValidators.username(value),
                controller: _nameController,
                hint: "Username",
                prefixIcon: Icons.person,
              ),

              // Email
              CodeNestTextFormField(
                validator: (value) => CodeNestValidators.email(value),
                controller: _emailController,
                hint: "Email",
                prefixIcon: Icons.alternate_email,
              ),

              // Password
              CodeNestTextFormField(
                validator: (value) => CodeNestValidators.password(value),
                controller: _passwordController,
                hint: "Password",
                prefixIcon: Icons.lock,
              ),

              CodeNestVerticalSpacer(23),

              // Submit button
              SizedBox(
                height: 45,
                width: double.infinity,
                child: CodeNestFilledBtn(
                  isLoading: authProvider.isLoading,
                  label: "Sign Up",
                  onPressed: _signUp,
                ),
              ),

              // Navigate to Sign In
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInScreen()),
                  );
                },
                child: const Text('Already have an account? Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
