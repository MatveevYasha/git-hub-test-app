import 'package:flutter/foundation.dart';

typedef UserId = int;

@immutable
class User {
  final UserId? id;

  final String avatarUrl;
  final String name;
  final int followers;
  final int following;

  const User({
    required this.avatarUrl,
    required this.name,
    required this.followers,
    required this.following,
    this.id,
  });

  @override
  int get hashCode => Object.hashAll([id, avatarUrl, name, followers, following]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! User) return false;

    return other.id == id &&
        other.avatarUrl == avatarUrl &&
        other.name == name &&
        other.followers == followers &&
        other.following == following;
  }
}
