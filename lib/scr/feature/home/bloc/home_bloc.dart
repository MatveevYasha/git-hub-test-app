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
}
