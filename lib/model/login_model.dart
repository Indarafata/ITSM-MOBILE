// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel? loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel? data) => json.encode(data!.toJson());

class LoginModel {
  LoginModel({
    required this.sessionToken,
  });

  String? sessionToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        sessionToken: json["session_token"],
      );

  Map<String, dynamic> toJson() => {
        "session_token": sessionToken,
      };
}
