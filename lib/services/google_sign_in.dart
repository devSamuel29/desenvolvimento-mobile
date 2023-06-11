import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInBugetBuddy {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount? get user => _user!;

  Future<bool> googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return false;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    return true;
  }

  Future<void> logout() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
