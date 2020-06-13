
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User{

  User(this.name,this.email);

  String name;
  String email;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);

  Map<String,dynamic> toJson()=> _$UserToJson(this);

}