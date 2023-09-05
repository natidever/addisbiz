import 'dart:convert';
import 'dart:developer';
import 'package:addisbiz/constants.dart';
import 'package:addisbiz/entites/companydata.dart';
import 'package:addisbiz/widgets/modifiedtextwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/customtextfield.dart';
import 'package:http/http.dart' as http;

List<CompanyData> companyData = [];
List<Business> companyDetail = [];
var categoryAlies;
var subcategoryAlies;

class CompanyList extends StatefulWidget {
  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  @override
  void initState() {
    super.initState();
    getCompanyData();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    log(arguments['categoryAlies']);
    log(arguments['subcategory']);
    categoryAlies = arguments['categoryAlies'];
    subcategoryAlies = arguments['subcategory'];
    log(categoryAlies);

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Company name"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).errorColor,
                // color:appBarColor,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: CustomTextField(
                  hintText: "Search in categories",
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            //These is second

            FutureBuilder<List<Business>>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  companyDetail=snapshot.data!;
                  return Container(
                    height: MediaQuery.sizeOf(context).height,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(
                          color: Theme.of(context).backgroundColor,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/companyinfo",
                                  arguments: {});
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 90,
                                    image:
                                        AssetImage('assets/headerimage4.jpg'),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(companyDetail[index].businessName ??
                                          ''),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomButton(
                                            callbackAction: () {},
                                            buttonText: "Addis ababa",
                                            buttonColor: buttonColor,
                                            textColor: blackColor,
                                            width: 89,
                                            height: 20,
                                          ),
                                          CustomButton(
                                            callbackAction: () {},
                                            buttonText: "+2519 1337 7471",
                                            buttonColor: buttonColor,
                                            textColor: blackColor,
                                            width: 150,
                                            height: 20,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.grey,
                          thickness: 0.1,
                        );
                      },
                      itemCount:
                          companyDetail.isNotEmpty ? companyDetail.length : 0,
                    ),
                  );
                } else {
                  return Container(
                    child: Text('Loading...'),
                  );
                }
              },
              future: getCompanyData(),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Business>> getCompanyData() async {
  try {
    var uri =
        'https://addisbiz.com/business-directory/api/v1/business_directory_companies?category=$categoryAlies&subcategory=$subcategoryAlies';
    var companyUri = Uri.parse(uri);
    var response = await http.get(companyUri);
    if (response.statusCode == 200) {
      var jsonBody = response.body;
      var jsonList = jsonDecode(jsonBody)['businesses'];
      // print("json list=> $jsonList");
     List <Business>nano=  (jsonList as List).map((json) => Business.fromJson(json)).toList();
        // print("value from business list => $nano");
      return nano;

    } else {
      // Handle the case when the API request fails
      throw Exception('Failed to fetch company data');
    }
  } catch (e) {
    print('Error in getCompanyData(): $e');
    throw e;
  }
  // return [];
}













// Future<List<Business>> getCompanyData() async {
//   try {
//     var uri =
//         'https://addisbiz.com/business-directory/api/v1/business_directory_companies?category=$categoryAlies&subcategory=$subcategoryAlies';
//     var companyUri = Uri.parse(uri);
//     print(
//         "================================================in the function=================");
//     String categoryAlis = "categoryAlies=";
//     String subcategoryAlis = "SubcategoryAlies=";
//     print(categoryAlis + categoryAlies);
//     print(subcategoryAlis + subcategoryAlies);

//     // Catch the body by requesting
//     var response = await http.get(companyUri);
//     if (response.statusCode == 200) {
//       var jsonBody = response.body;
//       var jsonData = jsonDecode(jsonBody);

//       if (jsonData['businesses'] != null) {
//         var jsonList = jsonData['businesses'];
//         return (jsonList as List)
//             .map((json) => Business.fromJson(json ?? {}))
//             .toList();
//       } else {
//         throw Exception('No business data found');
//       }
//     } else {
//       // Handle the case when the API request fails
//       throw Exception('Failed to fetch company data');
//     }
//   } catch (e) {
//     print('Error in getCompanyData(): $e');
//     throw e;
//   }
// }
