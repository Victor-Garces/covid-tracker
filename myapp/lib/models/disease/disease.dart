import 'package:json_annotation/json_annotation.dart';
part 'disease.g.dart';

@JsonSerializable()
class Disease {
  Disease();

  int id;
  String name;

  factory Disease.fromJson(Map<String, dynamic> json) =>
      _$DiseaseFromJson(json);

  Map<String, dynamic> toJson() => _$DiseaseToJson(this);
}
