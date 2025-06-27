import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:post_clean_arch/core/di/injection.dart';
import 'package:post_clean_arch/features/comments/presentation/provider/comments_provider.dart';
import 'package:post_clean_arch/features/posts/presentation/providers/post_provider.dart';
import 'package:post_clean_arch/features/posts/presentation/screens/post_screen.dart';
import 'package:post_clean_arch/features/users/presentation/providers/auth_email_provider.dart';
import 'package:post_clean_arch/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // di
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Comments Provider
        ChangeNotifierProvider(create: (context) => getIt<CommentsProvider>()),

        // Auth Provider
        ChangeNotifierProvider(create: (context) => getIt<AuthProvider>()),

        // Post Provider
        ChangeNotifierProvider(create: (context) => getIt<PostProvider>(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Clean Architecture (API + FIREBASE AUTH)',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: PostScreen(),
      ),
    );
  }
}
