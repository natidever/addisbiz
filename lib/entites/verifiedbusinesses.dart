// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Verifiedbusiness> verifiedbusinesses;

  Welcome({
    required this.verifiedbusinesses,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        verifiedbusinesses: List<Verifiedbusiness>.from(
            json["verifiedbusinesses"]
                .map((x) => Verifiedbusiness.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "verifiedbusinesses":
            List<dynamic>.from(verifiedbusinesses.map((x) => x.toJson())),
      };
}

class Verifiedbusiness {
  String nm;

  Verifiedbusiness({
    required this.nm,
  });

  factory Verifiedbusiness.fromJson(Map<String, dynamic> json) =>
      Verifiedbusiness(
        nm: json["Nm"],
      );

  Map<String, dynamic> toJson() => {
        "Nm": nm,
      };
}
