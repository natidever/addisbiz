import 'package:flutter/material.dart';
import 'dart:convert';

CompanyData welcomeFromJson(String str) =>
    CompanyData.fromJson(json.decode(str));

String welcomeToJson(CompanyData data) => json.encode(data.toJson());

class CompanyData {
  String? subcategoryalias;
  List<Business> businesses;

  CompanyData({
    this.subcategoryalias,
    required this.businesses,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) => CompanyData(
    subcategoryalias: json["subcategoryalias"],
    businesses: (json["businesses"] as List<dynamic>? ?? [])
        .map((x) => Business.fromJson(x))
        .toList(),
  );


  Map<String, dynamic> toJson() => {
        "subcategoryalias": subcategoryalias,
        "businesses": List<dynamic>.from(businesses.map((x) => x.toJson())),
      };
}

class Business {
  String? businessName;
  City? city;
  String? package;
  int? businessId;
  String? mobile;
  String? office;
  String? logo;
  String? fax;
  String? email;
  String? website;
  String? address;

  Business({
    this.businessName,
    this.city,
    this.package,
    this.businessId,
    this.mobile,
    this.office,
    this.logo,
    this.fax,
    this.email,
    this.website,
    this.address,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        businessName: json["BusinessName"] ?? '',
        city: cityValues.map[json["City"]] ?? City.ADDIS_ABABA,
        package: json["Package"] ?? '',
        businessId: json["BusinessID"] ?? '',
        mobile: json["Mobile"] ?? '',
        office: json["Office"] ?? '',
        logo: json["Logo"] ?? '',
        fax: json["Fax"] ?? '',
        email: json["Email"] ?? '',
        website: json["Website"] ?? '',
        address: json["Address"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "BusinessName": businessName,
        "City": cityValues.reverse[city],
        "Package": package,
        "BusinessID": businessId,
        "Mobile": mobile,
        "Office": office,
        "Logo": logo,
        "Fax": fax,
        "Email": email,
        "Website": website,
        "Address": address,
      };
}

enum City { ADAMA_NAZRETH, ADDIS_ABABA, ASSELA, MEKELLE, NEKEMTE }

final cityValues = EnumValues({
  "Adama / Nazreth": City.ADAMA_NAZRETH,
  "Addis Ababa": City.ADDIS_ABABA,
  "Assela": City.ASSELA,
  "Mekelle": City.MEKELLE,
  "Nekemte": City.NEKEMTE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
