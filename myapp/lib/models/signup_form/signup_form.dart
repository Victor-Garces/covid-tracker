import 'package:json_annotation/json_annotation.dart';
part 'signup_form.g.dart';

@JsonSerializable()
class SignupForm {
  SignupForm();

  String id;
  String name;
  String lastname;
  String phone;
  String email;
  String password;
  DateTime birthday;
  String location;
  List<int> diseasesIds;

  factory SignupForm.fromJson(Map<String, dynamic> json) =>
      _$SignupFormFromJson(json);

  Map<String, dynamic> toJson() => _$SignupFormToJson(this);
}
