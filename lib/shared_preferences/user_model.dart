class User {
  final String id;
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String photoPath;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.photoPath,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'lastName': lastName,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
    'photoPath': photoPath,
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    lastName: json['lastName'],
    email: json['email'],
    password: json['password'],
    phoneNumber: json['phoneNumber'],
    photoPath: json['photoPath'],
  );
}
