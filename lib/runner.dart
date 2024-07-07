import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_hub_test_app/scr/feature/home/bloc/home_bloc.dart';
import 'package:git_hub_test_app/scr/feature/home/bloc/home_event.dart';
import 'package:git_hub_test_app/scr/feature/home/bloc/home_state.dart';
import 'package:git_hub_test_app/scr/feature/home/data/users_repository.dart';
import 'package:git_hub_test_app/scr/feature/home/home_page.dart';
import 'package:git_hub_test_app/scr/feature/home/widgets/errors_widget.dart';
import 'package:git_hub_test_app/scr/feature/home/widgets/loading_widget.dart';

class GitHubApp extends StatelessWidget {
  const GitHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(repository: UsersRepositoryImpl(provider: ApiUsersProvider()))..add(InitialHomeEvent()),
      child: MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: Material(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return switch (state) {
                LoadingHomeState() => const LoadingWidget(),
                SuccessHomeState() => HomePage(users: state.users),
                _ => const ErrorsWidget(),
              };
            },
          ),
        ),
      ),
    );
  }
}
