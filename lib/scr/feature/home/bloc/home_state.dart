import 'package:core/core.dart';

sealed class HomeState {}

class LoadingHomeState extends HomeState {
  LoadingHomeState();
}

class SuccessHomeState extends HomeState {
  final List<User> users;

  SuccessHomeState({required this.users});
}

class ErrorHomeState extends HomeState {
  ErrorHomeState();
}
