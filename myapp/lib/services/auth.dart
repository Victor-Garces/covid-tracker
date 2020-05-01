import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/interfaces/base_auth.dart';

class Auth implements BaseAuth {
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getCurrentUser() async => await _firebaseAuth.currentUser();

  @override
  Future<bool> isEmailVerified() async {
    FirebaseUser currentUser = await _firebaseAuth.currentUser();
    return currentUser.isEmailVerified;
  }

  @override
  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  @override
  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
        );
    FirebaseUser user = result.user;
    return user.uid;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

}