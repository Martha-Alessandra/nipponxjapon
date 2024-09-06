import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createAccount(String correo, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: correo, password: pass);
      print(userCredential.user);
      return (userCredential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('La contraseña es muy débil');
        return 1;
      }  else if (e.code == 'email-already-in-use') { // Corrección aquí
      print('El correo ya está en uso');
      return 2;
      }
    } catch (e) {
      print(e);
    }
  }

  Future SignInEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      final a = userCredential.user;
      if (a?.uid != null) {
        return a?.uid;
      }
    } on FirebaseException catch (e) {
      if (e.code == 'users-not-found') {
        return 1;
      } else if (e.code == 'wrong-password') {
        return 2;
      }
    }
  }
}
