import 'package:equatable/equatable.dart';


/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable{
  final String? id;
  final String? email;
  final String? photo;
  final String? name;



  @override
  // TODO: implement props
  List<Object?> get props => [email, id, name, photo];

  const User({
    required this.id,
    this.email,
    this.photo,
    this.name,

  });
  static const empty = User(id: "");

}