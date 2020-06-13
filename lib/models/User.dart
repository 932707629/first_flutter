
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';
/// {@link https://github.com/flutterchina/json_model/blob/master/README-ZH.md}
/// 上述链接是讲解json_model的用法 以及其版本迭代更新
@JsonSerializable()
class User{

  User(this.name,this.email);

  String name;
  String email;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);

  Map<String,dynamic> toJson()=> _$UserToJson(this);

}