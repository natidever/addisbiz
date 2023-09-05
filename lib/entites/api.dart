import 'package:addisbiz/entites/companydata.dart';
import 'package:flutter/material.dart';
import 'package:addisbiz/entites/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Data>> getCategories() async {
  List<Data> categoryList = [];
  try {
    var categoriesURL = Uri.parse(
        "https://addisbiz.com/business-directory/api/v1/business_directory_categories");
    var response = await http.get(categoriesURL);
    if (response.statusCode == 200) {
      var jsonBody = response.body;
      var body = json.decode(jsonBody);

      // print(body['categories']);

      categoryList = List<Data>.from(
          body["categories"].map((json) => Data.fromJson(json)));
    } else {
      print("Error occurred: ${response.statusCode}");
      print("Error body: ${response.body}");
    }
  } catch (e) {
    print(e);
    print("Catch block");
  }

  return categoryList;
}

// Future<List<CompanyData>> getCompanyData() {
//   // https://addisbiz.com/business-directory/api/v1/business_directory_companies?category=importers&subcategory=Agricultural
//   try {
//     var uri =
//         "https://addisbiz.com/business-directory/api/v1/business_directory_companies?category=$category&$subcategory=Agricultural";
//     var subcategoryUrl = Uri.parse(uri);
//   } catch (e) {}
// //get the api
// }
