import 'package:addisbiz/widgets/customtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Data {
  String? businessSectorName;
  String? sectorIcon;
  String? route;
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-//
  String? alias;
  int? companyCount;
  int? parent;
  dynamic parent2;
  int? categoryId;
  List<Child>? children;

  Data({
    this.businessSectorName,
    this.sectorIcon,
    this.route,
    this.alias,
    this.companyCount,
    this.parent,
    this.parent2,
    this.categoryId,
    this.children,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        businessSectorName: json["CategoryName"],
        alias: json["alias"],
        companyCount: json["CompanyCount"],
        parent: json["Parent"],
        parent2: json["Parent2"],
        categoryId: json["CategoryID"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "CategoryName": businessSectorName,
        "alias": alias,
        "CompanyCount": companyCount,
        "Parent": parent,
        "Parent2": parent2,
        "CategoryID": categoryId,
        "children": List<dynamic>.from(children!.map((x) => x.toJson()))
      };
}

class Child {
  String categoryName;
  String alias;
  int companyCount;
  int parent;
  int? parent2;

  Child({
    required this.categoryName,
    required this.alias,
    required this.companyCount,
    required this.parent,
    required this.parent2,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        categoryName: json["CategoryName"],
        alias: json["alias"],
        companyCount: json["CompanyCount"],
        parent: json["Parent"],
        parent2: json["Parent2"],
      );

  Map<String, dynamic> toJson() => {
        "CategoryName": categoryName,
        "alias": alias,
        "CompanyCount": companyCount,
        "Parent": parent,
        "Parent2": parent2,
      };
}
