import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/interfaces/base_user.dart';
import 'package:myapp/models/signup_form/signup_form.dart';

class UserService implements BaseUser {
  final Firestore _firestore = Firestore.instance;

  @override
  Future<void> createUser(SignupForm signupForm) async {
    return _firestore.collection('users').document().setData(signupForm.toJson());
  }
}
