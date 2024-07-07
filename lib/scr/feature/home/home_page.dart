import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:git_hub_test_app/scr/feature/home/widgets/search_widget.dart';
import 'package:git_hub_test_app/scr/feature/home/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  final List<User> users;

  const HomePage({super.key, required this.users});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchWidget(),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('A-H'),
              Text('I-P'),
              Text('Q-Z'),
            ],
          ),
          Expanded(
            child: (widget.users.isEmpty)
                ? const Center(child: Text('Пользователи с таким именем не найдены'))
                : Scrollbar(
                    scrollbarOrientation: ScrollbarOrientation.top,
                    controller: _pageController,
                    thumbVisibility: true,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        ListView.builder(
                          itemCount: widget.users.length,
                          itemBuilder: (context, index) {
                            if (widget.users[index].name[0].contains(RegExp(r'[A-Ha-h]'))) {
                              return UserCard(user: widget.users[index]);
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                        ListView.builder(
                          itemCount: widget.users.length,
                          itemBuilder: (context, index) {
                            if (widget.users[index].name[0].contains(RegExp(r'[I-Pi-p]'))) {
                              return UserCard(user: widget.users[index]);
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                        ListView.builder(
                          itemCount: widget.users.length,
                          itemBuilder: (context, index) {
                            if (widget.users[index].name[0].contains(RegExp(r'[Q-Zq-z]'))) {
                              return UserCard(user: widget.users[index]);
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
