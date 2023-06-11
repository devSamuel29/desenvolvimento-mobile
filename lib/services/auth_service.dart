import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  AuthService() {
    _authCheck();
  }
  
  Future<bool> verifyUserLoginState() async {
    final user = _auth.currentUser;
    if(user != null) {
      return true;
    }
    return false;
  }

  _authCheck() {
    _auth.authStateChanges().listen((event) {
      user = (this.user == null) ? null : this.user;
    });
  }

  _getUser() {
    user = _auth.currentUser;
  }

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Usuário não encontrado!');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta!');
      } 
      throw AuthException("Erro desconhecido");
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }

  register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      SnackBar(content: Text("Usuário cadastrado com sucesso!"));
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('Senha muito fraca!');
      } else if (e.code == 'email-alredy-in-use') {
        throw AuthException('Email já cadastrado!');
      }
    }
  }
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}
