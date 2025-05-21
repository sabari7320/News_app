import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/errors/serverException.dart';
import 'package:news_app/feature/auth/data/model/user_model.dart';

abstract class AuthRemoteDatasources {
  // AuthRemoteDatasources();

  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> signin({required String email, required String password});
}

class AuthRemoteDatasourcesImpl implements AuthRemoteDatasources {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      print('User created: ${credential.user?.uid}');

      await _firestore.collection('userData').doc(credential.user!.uid).set({
        'name': name,
        "uid": credential.user!.uid,
        'email': email,
        'password': password,
      });

      //       AppSnackbar.show(
      //   context: context,
      //   message: 'Signup successful!',
      //   backgroundColor: Colors.green,
      // );
      return UserModel(name: name, email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("signUppppp error code......");
      print(e.code);
      throw ServerException(message: e.code);
    }
  }

  @override
  Future<UserModel> signin({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential.user?.displayName);
      return UserModel(name: '', email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      throw ServerException(message: e.code);
    }
  }
}
