import '../entities/user.dart';

abstract interface class UsersRepository {
  Future<List<User>> getUsers();
}
