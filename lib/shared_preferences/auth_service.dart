import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';

class AuthService {
  static const String _usersKey = 'users';
  static const String _currentUserKey = 'current_user';



  static Future<void> signUp(User newUser) async {
    final users = await loadUsers();
    users.add(newUser);
    await saveUsers(users);
  }

  static Future<User?> signIn(String email, String password) async {
    final users = await AuthService.loadUsers();
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }
    return null;
  }

  static Future<void> editCurrentUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentUserKey, jsonEncode(user.toJson()));
  }

  static Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_currentUserKey);
    if (userJson == null) return null;
    return User.fromJson(jsonDecode(userJson));
  }

  static Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserKey);
  }


  static Future<void> saveUsers(List<User> users) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> userJsonList = users.map((user) => jsonEncode(user.toJson())).toList();
    await prefs.setStringList(_usersKey, userJsonList);
  }

  static Future<List<User>> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? userJsonList = prefs.getStringList(_usersKey);
    if (userJsonList == null) return [];
    return userJsonList.map((userJson) => User.fromJson(jsonDecode(userJson))).toList();
  }

}
