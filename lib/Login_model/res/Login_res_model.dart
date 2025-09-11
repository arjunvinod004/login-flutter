// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) =>
    LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
  bool isSuccess;
  List<Datum> data;
  String errorMessage;

  LoginResModel({
    required this.isSuccess,
    required this.data,
    required this.errorMessage,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        isSuccess: json["IsSuccess"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
        errorMessage: json["ErrorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "ErrorMessage": errorMessage,
      };
}

class Datum {
  int userId;
  String userName;
  int userGrpId;
  String userImage;
  int cmpId;
  int brId;
  int faId;
  int staffId;
  String userType;
  String appPageName;
  String staffName;

  Datum({
    required this.userId,
    required this.userName,
    required this.userGrpId,
    required this.userImage,
    required this.cmpId,
    required this.brId,
    required this.faId,
    required this.staffId,
    required this.userType,
    required this.appPageName,
    required this.staffName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["UserId"],
        userName: json["UserName"],
        userGrpId: json["UserGrpId"],
        userImage: json["UserImage"],
        cmpId: json["CmpId"],
        brId: json["BrId"],
        faId: json["FaId"],
        staffId: json["StaffId"],
        userType: json["UserType"],
        appPageName: json["AppPageName"],
        staffName: json["StaffName"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "UserName": userName,
        "UserGrpId": userGrpId,
        "UserImage": userImage,
        "CmpId": cmpId,
        "BrId": brId,
        "FaId": faId,
        "StaffId": staffId,
        "UserType": userType,
        "AppPageName": appPageName,
        "StaffName": staffName,
      };
}
