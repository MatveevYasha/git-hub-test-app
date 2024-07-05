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

  @JsonKey(name: 'following_url')
  final String followingUrl;

  const UserDTO({
    required this.avatarUrl,
    required this.name,
    required this.followersUrl,
    required this.followingUrl,
  });

  factory UserDTO.fromJson(Json json) => _$UserDTOFromJson(json);

  // Future<int> getFollowersCounts(String url) async {
  //   final response = await dio.get(url);

  //   final listJson = List.castFrom<dynamic, Json>(response.data);

  //   return listJson.length;
  // }

  User toEntity() {
    return User(
      avatarUrl: avatarUrl,
      name: name,
      followers: 1,
      following: 2,
    );
  }
}
