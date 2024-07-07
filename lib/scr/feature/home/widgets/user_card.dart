import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:git_hub_test_app/scr/shared/helpers/string_extension.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(child: Image.network(user.avatarUrl)),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name.capitalize()),
                  Text('${user.followers} / ${user.following}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
