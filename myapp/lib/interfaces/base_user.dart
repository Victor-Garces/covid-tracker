import 'dart:async';

import 'package:myapp/models/signup_form/signup_form.dart';

abstract class BaseUser {
  Future<void> createUser(SignupForm signupForm);
}
