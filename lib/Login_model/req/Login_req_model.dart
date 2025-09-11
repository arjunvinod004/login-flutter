// To parse this JSON data, do
//
//     final loginReqModel = loginReqModelFromJson(jsonString);

import 'dart:convert';

LoginReqModel loginReqModelFromJson(String str) =>
    LoginReqModel.fromJson(json.decode(str));

String loginReqModelToJson(LoginReqModel data) => json.encode(data.toJson());

class LoginReqModel {
  String userName;
  String pwd;

  LoginReqModel({
    required this.userName,
    required this.pwd,
  });

  factory LoginReqModel.fromJson(Map<String, dynamic> json) => LoginReqModel(
        userName: json["UserName"],
        pwd: json["Pwd"],
      );

  Map<String, dynamic> toJson() => {
        "UserName": userName,
        "Pwd": pwd,
      };
}
