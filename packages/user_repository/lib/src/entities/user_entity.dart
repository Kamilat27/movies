import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String photoUrl;

  const MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  Map<String, Object?> toJSON() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  factory MyUserEntity.fromJSON(Map<String, dynamic> json) => MyUserEntity(
    userId: json['userId'],
    email: json['email'],
    name: json['name'],
    photoUrl: json['photoUrl'] ?? "",
  );

  @override
  List<Object?> get props => [userId, email, name, photoUrl];
}
