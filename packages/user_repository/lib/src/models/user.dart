import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String photoUrl;

  const MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  factory MyUser.fromEntity(MyUserEntity entity) => MyUser(
    userId: entity.userId,
    email: entity.email,
    name: entity.name,
    photoUrl: entity.photoUrl,
  );

  static const empty = MyUser(
    userId: "",
    email: "",
    name: "",
    photoUrl: "",
  );

  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
    String? photoUrl,
  }) {
    return MyUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      photoUrl: photoUrl,
    );
  }

  @override
  List<Object?> get props => [userId, email, name, photoUrl];
}
