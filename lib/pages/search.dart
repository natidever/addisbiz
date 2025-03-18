import 'dart:convert';
import 'dart:io';

import 'package:addisbiz/entites/companydata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import '../constants.dart';
import '../exception/searchnotfound.dart';

class Search extends SearchDelegate {
  bool slowConnection = false;
  String? userQuery;
  List<Business> companyDetail = [];

  bool isCloseClicked = false;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
          isCloseClicked = true;
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios));
  }

  final spinkit = SpinKitWaveSpinner(
    size: 150,
    color: baseColor,
    waveColor: Colors.yellow,
  );

  @override
  Widget buildResults(BuildContext context) {
    if (isCloseClicked == true) {
      isCloseClicked = false;
      return Container();
    }
    userQuery = query;
    // getCompanyDataSearch();
    return FutureBuilder<List<Business>>(
      builder: (context, snapshot) {
        try {
          if (snapshot.hasData) {
            companyDetail = snapshot.data!;
            if (companyDetail.isEmpty) {
              return SearchNotFound();
            }
            if (slowConnection == true) {
              return Text('slow connection ');
            }
            return Container(
              height: MediaQuery.sizeOf(context).height,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    // color: Theme.of(context).backgroundColor,
                    // color: Color.fromARGB(216, 216, 216, 1),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/companyinfo",
                            arguments: {
                              "businessName":
                                  companyDetail[index].businessName ?? " ",
                              "businessId":
                                  companyDetail[index].businessId ?? '',
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                            child: Image(
                                fit: BoxFit.fill,
                                width: 100,
                                height: 90,
                                image: AssetImage('assets/addisbiz2.jpg')),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Icon(
                                    Icons.business,
                                    color: blackColor,
                                    size: 30,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    companyDetail[index].businessName ?? " ",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(),
                                  ),
                                ),
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
                itemCount: companyDetail.isNotEmpty ? companyDetail.length : 0,
              ),
            );
          } else {
            return Center(
              child: spinkit,
            );
            // return listshimmer();
          }
        } catch (e) {
          if (e is http.ClientException) {
            print('we got client excetption ');
          }
          if (e is SocketException) {
            print('we got SCOKET EXCEPTION');
          }
        }
        return Container();
      },
      future: getCompanyDataSearch(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text(" ");
  }

  Future<List<Business>> getCompanyDataSearch() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      slowConnection = true;
    }
    try {
      var uri =
          "https://addisbiz.com/business-directory/api/v1/business_directory_findcompanies?SearchTerm=$userQuery";
      var companyUri = Uri.parse(uri);
      // print(
      //     "================================================in the function=================");
      // String categoryAlis = "categoryAlies=";
      // String subcategoryAlis = "SubcategoryAlies=";
      // print(categoryAlis + categoryAlies);
      // print(subcategoryAlis + subcategoryAlies);

      // Catch the body by requesting
      var response = await http.get(companyUri);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        var jsonData = jsonDecode(jsonBody);
        print('jsonBody == > $jsonBody');

        if (jsonData['businesses'] != null) {
          var jsonList = jsonData['businesses'];
          print('json listafter decodeing =>jsonList');
          return (jsonList as List)
              .map((json) => Business.fromJson(json ?? {}))
              .toList();
        } else {
          throw Exception('No business data found(Search )--');
        }
      } else {
        // Handle the case when the API request fails
        throw Exception('Failed to fetch company data ( Search )--');
      }
    } catch (e) {
      print('Error in getCompanyData in Search(): $e');
      throw e;
    }
  }
}
