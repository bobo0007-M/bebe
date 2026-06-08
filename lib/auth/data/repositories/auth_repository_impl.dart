// import 'package:leloprofs/features/auth/domain/entities/auth_user.dart';


import 'package:bebe/auth/domain/entities/auth_user.dart';

import '../../domain/repositories/auth_repository.dart';
import '../services/firebase_auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService firebaseAuthServices;
  AuthRepositoryImpl(this.firebaseAuthServices);
  @override
  Future<AuthUser?> getCurrentUser() async {
    final user = await firebaseAuthServices.getUser();

    if (user != null) {
      return AuthUser(
        email: user.email!,
        id: user.uid,
        name: user.displayName!, imageUrl: user.photoURL??"",
      );
    }
    return null;
  }

  @override
  Future<void> signIn(String email, String password) async {
await firebaseAuthServices.signIn(email, password);
  }

  @override
  Future<AuthUser?> signInWithGoogle() async {
    return await firebaseAuthServices.signInWithGoogle();
  }

  @override
  Future<void> signOut() async {
  await firebaseAuthServices.signOut();
  }

  @override
  Future<void> signUp(String email, String password, String name) async{
   await firebaseAuthServices.signUp(email, password);
  }
}
