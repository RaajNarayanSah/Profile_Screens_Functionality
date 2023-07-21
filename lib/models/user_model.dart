// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? reportingManager;
  String? employeeCode;
  String? email;
  String? contact;
  String? dob;
  String? bloodGroup;

  UserModel({
    this.reportingManager,
    this.employeeCode,
    this.email,
    this.contact,
    this.dob,
    this.bloodGroup,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        reportingManager: json["reporting_manager"],
        employeeCode: json["employee_code"],
        email: json["email"],
        contact: json["contact"],
        dob: json["dob"],
        bloodGroup: json["blood_group"],
      );

  Map<String, dynamic> toJson() => {
        "reporting_manager": reportingManager,
        "employee_code": employeeCode,
        "email": email,
        "contact": contact,
        "dob": dob,
        "blood_group": bloodGroup,
      };
}
