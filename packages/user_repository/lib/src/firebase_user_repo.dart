import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:user_repository/src/models/user.dart';

import '../user_repository.dart';

class FirebaseUserRepo implements UserRepository{
  final FirebaseAuth _firebaseAuth;

  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user => _firebaseAuth.authStateChanges().map((firebaseUser)=> firebaseUser);

  @override
  Future<void> setUserData(MyUser myUser) async{
    try{
      await usersCollection.doc(myUser.userId).set(myUser.toEntity().toJSON());
      log("-----------------"+myUser.toEntity().toJSON().toString());

      await _firebaseAuth.currentUser?.updateDisplayName(myUser.name);

      if (myUser.photoUrl != null) {
        await _firebaseAuth.currentUser?.updatePhotoURL(myUser.photoUrl);
      }
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try{
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email,
          password: password
      );

      myUser = myUser.copyWith(
        userId: user.user!.uid,
      );

      await setUserData(myUser);
      return myUser;
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateProfile({String? name, String? photoUrl}) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) return;

      final userData = <String, dynamic>{};
      if (name != null) userData['name'] = name;
      if (photoUrl != null) userData['photoUrl'] = photoUrl;

      await usersCollection.doc(user.uid).update(userData);

      if (name != null) {
        await user.updateDisplayName(name);
      }
      if (photoUrl != null) {
        await user.updatePhotoURL(photoUrl);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();

  }

  Stream<MyUser?> getUserData(String userId) {
    return usersCollection.doc(userId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return MyUser.fromEntity(MyUserEntity.fromJSON(snapshot.data()!));
      }
      return null;
    });
  }
}