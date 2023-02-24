import 'dart:convert';

import '../utils/helper.dart';

class AuthenticationResult {
  String? token;
  String? tokenType;
  User? user;
  List<String>? roles;
  Bundle? bundle;

  AuthenticationResult({
    this.token,
    this.tokenType,
    this.user,
    this.roles,
    this.bundle,
  });

  factory AuthenticationResult.fromRawJson(String str) =>
      AuthenticationResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthenticationResult.fromJson(Map<String, dynamic> json) =>
      AuthenticationResult(
        token: json["token"],
        tokenType: json["tokenType"],
        user: User.fromJson(json["user"]),
        roles: json["roles"].cast<String>(),
        bundle:
        json['bundle'] != null ? Bundle.fromJson(json['bundle']) : null,
      );

  Map<String, dynamic> toJson() => {
    "token": token,
    "tokenType": tokenType,
    "user": user == null ? null : user?.toJson(),
  };
}

class User {
  User({this.id, this.phone, this.fullName});

  String? id;
  String? phone;
  String? fullName;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      phone: json["phone"] == null ? null : replacePhoneCode(json["phone"]),
      fullName: json["fullName"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "phone": phone, "fullName": fullName};
}

class Bundle {
  List<AttributesBundle>? attributes;

  Bundle({this.attributes});

  Bundle.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = <AttributesBundle>[];
      json['attributes'].forEach((v) {
        attributes!.add(AttributesBundle.fromJson(v));
      });
    }
  }
}

class AttributesBundle {
  String? key;
  int? value;

  AttributesBundle({this.key, this.value});

  factory AttributesBundle.fromJson(Map<String, dynamic> json) {
    return AttributesBundle(
        key : json['key'],
        value : json['value'],
    );
  }
}
