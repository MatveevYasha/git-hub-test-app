import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:git_hub_test_app/scr/feature/home/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  final List<User> users;

  const HomePage({super.key, required this.users});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.users.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return UserCard(user: widget.users[index]);
      },
    );
  }
}
