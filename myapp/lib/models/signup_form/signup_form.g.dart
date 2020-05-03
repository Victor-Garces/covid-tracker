// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupForm _$SignupFormFromJson(Map<String, dynamic> json) {
  return SignupForm()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..lastname = json['lastname'] as String
    ..phone = json['phone'] as String
    ..email = json['email'] as String
    ..password = json['password'] as String
    ..birthday = json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String)
    ..location = json['location'] as String
    ..diseasesIds =
        (json['diseasesIds'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$SignupFormToJson(SignupForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'birthday': instance.birthday?.toIso8601String(),
      'location': instance.location,
      'diseasesIds': instance.diseasesIds,
    };
