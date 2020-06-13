import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'UserInfo.g.dart';

@JsonSerializable()
class UserInfo {
    UserInfo();

    String name;
    User father;
    List<User> friends;
    List<String> keywords;
    num age;
    
    factory UserInfo.fromJson(Map<String,dynamic> json) => _$UserInfoFromJson(json);
    Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
