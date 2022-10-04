import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class User
{
  final id;
  final name;
  final email;
  final password;
  final address;
  final type;
  final token;

  User(this.id, this.name, this.email, this.password, this.address, this.type, this.token);




Map<String,dynamic> toMap()
{
  return {
    'id':id,
    'name':name,
    'email':email,
    'password':password,
    'address':address,
    'type':type,
    'token':token
  };
}

factory User.fromMap(Map<String,dynamic> map)
{
  return User(
      map['_id'] ?? '',
      map['name'] ?? '',
      map['email'] ?? '',
      map['password'] ?? '',
      map['address'] ?? '',
      map['type'] ?? '',
      map['token'] ?? '' );

}



String toJson()=> json.encode(toMap());

factory User.fromJson(String source) => User.fromMap(jsonDecode(source));

}