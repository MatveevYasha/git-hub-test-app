import 'package:flutter/material.dart';
import 'package:git_hub_test_app/scr/feature/home/home_page.dart';

class GitHubApp extends StatelessWidget {
  const GitHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
