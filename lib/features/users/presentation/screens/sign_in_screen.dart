import 'package:code_nest_ui/code_nest_ui.dart';
import 'package:flutter/material.dart';
import 'package:post_clean_arch/features/comments/presentation/screens/comments_screen.dart';
import 'package:provider/provider.dart';
import 'package:post_clean_arch/features/users/presentation/providers/auth_email_provider.dart';
import 'package:post_clean_arch/features/users/presentation/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Sign in method
  Future<void> _signIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      final authProvider = context.read<AuthProvider>();

      await authProvider.signIn(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (authProvider.currentUser != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Sign In Successful!")));

        // Comments Screen
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
      } else if (authProvider.error != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(authProvider.error!)));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [
              // Email
              CodeNestTextFormField(
                controller: _emailController,
                hint: "Email Address",
                prefixIcon: Icons.email,
                validator: (value) => CodeNestValidators.email(value),
              ),

              // Password
              CodeNestPasswordTextFormField(
                controller: _passwordController,
                hint: "Password",
                prefixIcon: Icons.lock,
                validator: (value) => CodeNestValidators.password(value),
              ),

              CodeNestVerticalSpacer(23),

              // Sign In button
              SizedBox(
                height: 45,
                width: double.infinity,
                child: CodeNestFilledBtn(
                  isLoading: authProvider.isLoading,
                  label: "Sign In",
                  onPressed: _signIn,
                ),
              ),

              // Sign Up navigation
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()),
                  );
                },
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
