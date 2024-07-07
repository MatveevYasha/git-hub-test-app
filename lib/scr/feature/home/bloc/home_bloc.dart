import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_hub_test_app/scr/feature/home/bloc/home_event.dart';
import 'package:git_hub_test_app/scr/feature/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UsersRepository _repository;

  HomeBloc({
    required UsersRepository repository,
  })  : _repository = repository,
        super(LoadingHomeState()) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        final InitialHomeEvent event => _initial(event, emit),
        final SearchHomeEvent event => _search(event, emit),
      },
    );
  }

  Future<void> _initial(InitialHomeEvent event, Emitter<HomeState> emit) async {
    try {
      final List<User> users = await _repository.getUsers();

      emit(SuccessHomeState(users: users));
    } on Exception catch (_) {
      emit(ErrorHomeState());
    }
  }

  Future<void> _search(SearchHomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(LoadingHomeState());

      final List<User> users = await _repository.getUsers();

      final List<User> sortUsers = users.where((user) => user.name.contains(event.searchString)).toList();

      emit(SuccessHomeState(users: sortUsers));
    } on Exception catch (_) {
      emit(ErrorHomeState());
    }
  }
}
