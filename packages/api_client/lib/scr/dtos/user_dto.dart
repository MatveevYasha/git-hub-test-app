import 'package:api_client/scr/providers/get_users_provider/users_provider.dart';
import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

typedef Json = Map<String, Object?>;

@JsonSerializable(createToJson: false)
class UserDTO {
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @JsonKey(name: 'login')
  final String name;

  @JsonKey(name: 'followers_url')
  final String followersUrl;

  @JsonKey(name: 'subscriptions_url')
  final String followingUrl;

  const UserDTO({
    required this.avatarUrl,
    required this.name,
    required this.followersUrl,
    required this.followingUrl,
  });

  factory UserDTO.fromJson(Json json) => _$UserDTOFromJson(json);

  Future<int> getCountsFromUrl(String url) async {
    dio.options.headers['Accept'] = 'application/vnd.github+json';
    dio.options.headers['Authorization'] = 'Bearer $apiKey';
    dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';

    final response = await dio.get(url);

    final listJson = List.castFrom<dynamic, Json>(response.data);

    if (listJson.isNotEmpty) return listJson.length;

    return 0;
  }

  Future<User> toEntity() async {
    return User(
      avatarUrl: avatarUrl,
      name: name,
      followers: await getCountsFromUrl(followersUrl),
      following: await getCountsFromUrl(followingUrl),
    );
  }
}
