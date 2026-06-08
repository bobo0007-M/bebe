import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entities/auth_user.dart';

class FirebaseAuthService {
  // initialisation des intances de FirebaseAuth et GoogleSignIn
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // get current user
  Future<User?> getUser() async {
    return firebaseAuth.currentUser;
  }

  // méthode pour se connecter avec email et mot de passe
  Future<void> signIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  // méthode pour s'inscrire avec email et mot de passe
  Future<void> signUp(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  // méthode pour se connecter avec Google web et mobile complet ensemble pour éviter les problèmes de compatibilité
  Future<AuthUser?> signInWithGoogle() async {
    try {
      UserCredential credential;

      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        credential = await firebaseAuth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

        if (googleUser == null) {
          return null;
        }

        final googleAuth = await googleUser.authentication;

        final authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        credential = await firebaseAuth.signInWithCredential(authCredential);
      }

      final user = credential.user;

      if (user == null) return null;

      return AuthUser(
        id: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '', imageUrl: user.photoURL??"",
      );
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }
  Future<void> signOut() async{
    try {
     await firebaseAuth.signOut();
     await googleSignIn.signOut() ;
    } catch (e) {
      throw Exception("Failed to logOut : $e");
    }
  }
}
