import 'package:dio/dio.dart';
import 'package:core/core.dart';

import '../../dtos/user_dto.dart';

final dio = Dio();

const String apiKey = String.fromEnvironment('API_KEY');

class ApiUsersProvider implements UsersProvider {
  @override
  Future<List<User>> getUsers() async {
    dio.options.headers['Accept'] = 'application/vnd.github+json';
    dio.options.headers['Authorization'] = 'Bearer _';
    dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';

    final response = await dio.get('https://api.github.com/users');

    final List<User> list = [];

    final listJson = List.castFrom<dynamic, Json>(response.data);

    for (var user in listJson) {
      final foo = await UserDTO.fromJson(user).toEntity();

      list.add(foo);
    }

    return list;
  }
}
