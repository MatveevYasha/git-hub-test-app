import 'package:core/core.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersProvider _provider;

  const UsersRepositoryImpl({required UsersProvider provider}) : _provider = provider;

  @override
  Future<List<User>> getUsers() => _provider.getUsers();
}
