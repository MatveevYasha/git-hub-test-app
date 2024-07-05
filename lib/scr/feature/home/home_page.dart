import 'package:api_client/scr/providers/get_users_provider/users_provider.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:git_hub_test_app/scr/feature/home/data/users_repository.dart';

final dio = Dio();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _counter = 0;
  final _foo = UsersRepositoryImpl(provider: ApiUsersProvider());

  Future<void> _incrementCounter() async {
    final response = await dio.get('https://api.github.com/users');

    // //     headers: {
    // //   'X-GitHub-Api-Version': '2022-11-28'
    // // }

    print(response.data);

    // final List<User> one = await _foo.getUsers();

    // print(one[0].name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
