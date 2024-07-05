import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:core/core.dart';

import '../../dtos/user_dto.dart';

final dio = Dio();

class ApiUsersProvider implements UsersProvider {
  @override
  Future<List<User>> getUsers() async {
    final response = await dio.get('https://api.github.com/users');

    // final foo = response.data;

    final List<User> list = [];

    final listJson = List.castFrom<dynamic, Json>(response.data);

    // final list = listJson.map((e) => UserDTO.fromJson(e).toEntity()).toList();

    for (var user in listJson) {
      final foo = await UserDTO.fromJson(user).toEntity();

      list.add(foo);
    }

    // return [User(avatarUrl: 'avatarUrl', name: '11', followers: 1, following: 1)];

    return list;
  }
}
