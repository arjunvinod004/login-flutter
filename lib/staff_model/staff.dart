// To parse this JSON data, do
//
//     final staff = staffFromJson(jsonString);

import 'dart:convert';

Staff staffFromJson(String str) => Staff.fromJson(json.decode(str));

String staffToJson(Staff data) => json.encode(data.toJson());

class Staff {
  bool isSuccess;
  List<Datum> data;
  String errorMessage;

  Staff({
    required this.isSuccess,
    required this.data,
    required this.errorMessage,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
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
  int id;
  String name;
  String ids;
  String code;

  Datum({
    required this.id,
    required this.name,
    required this.ids,
    required this.code,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"],
    name: json["NAME"],
    ids: json["IDS"],
    code: json["Code"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "NAME": name,
    "IDS": ids,
    "Code": code,
  };
}
