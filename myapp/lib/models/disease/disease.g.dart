// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Disease _$DiseaseFromJson(Map<String, dynamic> json) {
  return Disease()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic> _$DiseaseToJson(Disease instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
