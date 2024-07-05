import '../entities/user.dart';

abstract interface class UsersProvider {
  Future<List<User>> getUsers();
}
