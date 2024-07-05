import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:core/core.dart';

import '../../dtos/user_dto.dart';

final dio = Dio();

class ApiUsersProvider implements UsersProvider {
  @override
  Future<List<User>> getUsers() async {
    final response = await dio.get('https://api.github.com/users');

    final foo = response.data;

    // final listJson = List.castFrom<dynamic, Json>(response.data);

    // return listJson.map((e) => UserDTO.fromJson(e).toEntity()).toList();

    return [User(avatarUrl: 'avatarUrl', name: '11', followers: 1, following: 1)];
  }
}
