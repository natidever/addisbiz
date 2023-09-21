import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:addisbiz/constants.dart';
import 'package:addisbiz/entites/companydata.dart';
import 'package:addisbiz/pages/companylist.dart';
import 'package:addisbiz/widgets/button.dart';
import 'package:addisbiz/widgets/customtextfield.dart';
import 'package:addisbiz/widgets/modifiedtextwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../entites/data.dart';
import '../entites/verifiedbusinesses.dart';
import 'homepage.dart';

var businessId;

class CompanyInfo extends StatefulWidget {
  @override
  State<CompanyInfo> createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCompanyDetail();
  }

  List<Business>? companyDetailData;

  void openPhoneDialer(String phoneNumber) async {
    print("=====================call functionn=======================");
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber

        // path: '0913377471'
        );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('can not lauch this uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    businessId = arguments['businessId'];
    // print('BusinessId====>>>>>$businessId');

    // Future<void> openWebsites() async {
    //   final Uri uri = Uri(
    //       scheme: 'https',
    //       // path: mobile ,
    //       host: 'https://epioncss.com/');

    //   if (!await launchUrl(uri, mode: LaunchMode.externalApplication))
    //     ;
    //   else {
    //     throw 'error occured while opening the url';
    //   }
    // }
    CompanyInfoShimmer() {
      return Shimmer.fromColors(
          child: Container(
            width: 400,
            height: 200,
          ),
          baseColor: Colors.red,
          highlightColor: Colors.blue);
    }

    String validateUri(String url) {
      Uri uri = Uri.parse(url);
      if (uri.scheme.isEmpty) {
        return 'http://$url';
      } else {
        return url;
      }
    }

    Future<void> _launchUrl(String _url) async {
      _url = validateUri(_url);
      if (!await launchUrl(Uri.parse(_url))) {
        throw Exception('Could not launch $_url');
      }
    }

    void lauchEmail(String emailTo) async {
      Uri emailParameters = Uri(
        scheme: 'mailTo',
        path: emailTo,
        query: 'subject=App Feedback&body=App Feedback',
      );

      if (!await launchUrl(emailParameters)) {
        throw Exception('Could not launch $emailParameters');
      }
    }

    return Scaffold(
      // backgroundColor: Color.fromRGBO(228, 228, 228, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: baseColor,
            floating: false,
            automaticallyImplyLeading: true,
            iconTheme: IconThemeData(color: Colors.grey),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color.fromARGB(255, 244, 244, 244)),
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/bluraddisbiz.jpg')),
            ),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.only(bottom: 15),
          // ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(15),
          //       child: Container(
          //         width: double.infinity,
          //         height: MediaQuery.of(context).size.height * 0.35,

          //         decoration: BoxDecoration(
          //           color: backgroundColorForLightMode,
          //         ),
          //         child: Row(children: [
          //           Expanded(
          //             flex: 2,
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 // image: DecorationImage(
          //                 //   fit: BoxFit.fill,
          //                 //   image: AssetImage('assets/contactus.jpg'),
          //                 // ),
          //               ),
          //               child: Padding(
          //                 padding: const EdgeInsets.fromLTRB(15.0, 10, 0, 0),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     RichText(
          //                       text: TextSpan(
          //                           // style: DefaultTextStyle.of(context).style,
          //                           children: <TextSpan>[
          //                             TextSpan(
          //                               text: "Contact ",
          //                               style: GoogleFonts.italiana(
          //                                 fontSize: 20,
          //                                 color: blackColor,
          //                               ),
          //                             ),
          //                             TextSpan(
          //                               text: "Us",
          //                               style: GoogleFonts.italiana(
          //                                   fontSize: 22,
          //                                   color: baseColor,
          //                                   fontWeight: FontWeight.bold),
          //                             )
          //                           ]),
          //                     ),
          //                     SizedBox(
          //                       height: 60,
          //                     ),
          //                     Text("Let's work together",
          //                         style: GoogleFonts.italiana(
          //                             fontSize: 22,
          //                             color: blackColor,
          //                             fontWeight: FontWeight.bold),
          //                             ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             color: Colors.transparent,
          //             child: VerticalDivider(
          //               color: Colors.black,
          //               thickness: 2,
          //               width: 0.8,
          //               indent: 70,
          //               endIndent: 70,
          //             ),
          //           ),
          //           Expanded(
          //               flex: 3,
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   color: Colors.white,
          //                 ),
          //                 child: FutureBuilder<List<Business>>(
          //                     future: getCompanyDetail(),
          //                     builder: (context, snapshot) {
          //                       companyDetailData = snapshot.data;
          //                       List<String> mobileNumbers = companyDetailData
          //                               ?.first.mobile
          //                               ?.split(';') ??
          //                           [];
          //                       print('Mobile numbers $mobileNumbers');
          //                       List<String> officeNumbers = companyDetailData
          //                               ?.first.office
          //                               ?.split(';') ??
          //                           [];
          //                       print('office numbers $officeNumbers');
          //                       return Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         // mainAxisSize: MainAxisSize.min,
          //                         children: [
          //                           companyDetailData?.first.website == ''
          //                               ? Container(
          //                                   width: 1,
          //                                   height: 1,
          //                                 )
          //                               : GestureDetector(
          //                                   onTap: () {
          //                                     var parseedUrl = Uri.parse(
          //                                         companyDetailData
          //                                                 ?.first.website ??
          //                                             '');
          //                                     print('webiste');
          //                                     print(companyDetailData
          //                                         ?.first.website);
          //                                     _launchUrl(parseedUrl);
          //                                   },
          //                                   child: Container(
          //                                     width: 70,
          //                                     height: 30,
          //                                     child: Center(
          //                                         child: Text("Website")),
          //                                     decoration: BoxDecoration(
          //                                       color: baseColor,
          //                                       borderRadius:
          //                                           BorderRadius.circular(5),
          //                                     ),
          //                                   ),
          //                                 ),
          //                           SizedBox(
          //                             height: 5,
          //                           ),
          //                           companyDetailData?.first.email == ''
          //                               ? Container(
          //                                   height: 1,
          //                                   width: 1,
          //                                 )
          //                               : GestureDetector(
          //                                   onTap: () {
          //                                     String email = companyDetailData
          //                                             ?.first.email ??
          //                                         '';
          //                                     print("Email : $email");
          //                                     lauchEmail(email);
          //                                   },
          //                                   child: Container(
          //                                     width: 70,
          //                                     height: 30,
          //                                     child:
          //                                         Center(child: Text("Email")),
          //                                     decoration: BoxDecoration(
          //                                       color: baseColor,
          //                                       borderRadius:
          //                                           BorderRadius.circular(5),
          //                                     ),
          //                                   ),
          //                                 ),
          //                           SizedBox(
          //                             height: 15,
          //                           ),
          //                           Text(
          //                             "Call",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                           SizedBox(
          //                             height: 5,
          //                           ),
          //                           Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.center,
          //                             // mainAxisSize: MainAxisSize.min,
          //                             children: [
          //                               Column(
          //                                 // mainAxisSize: MainAxisSize.min,
          //                                 children: [
          //                                   Text(
          //                                     "Office",
          //                                     style: TextStyle(
          //                                         fontWeight: FontWeight.bold),
          //                                   ),
          //                                   SizedBox(
          //                                     height: 100,
          //                                     width: 110,
          //                                     child: ListView.builder(
          //                                       // shrinkWrap: true,
          //                                       itemCount: officeNumbers.length,
          //                                       itemBuilder: ((context,
          //                                               index) =>
          //                                           Padding(
          //                                             padding: const EdgeInsets
          //                                                 .fromLTRB(0, 5, 0, 5),
          //                                             child: GestureDetector(
          //                                               onTap: () {
          //                                                 String cickedONumber =
          //                                                     officeNumbers[
          //                                                         index];
          //                                                 openPhoneDialer(
          //                                                     cickedONumber);
          //                                               },
          //                                               child: Text(
          //                                                 officeNumbers[index],
          //                                                 style: TextStyle(
          //                                                   color: blackColor,
          //                                                   fontSize: 14,
          //                                                 ),
          //                                               ),
          //                                             ),
          //                                           )),
          //                                     ),
          //                                   )
          //                                 ],
          //                               ),
          //                               SizedBox(
          //                                 width: 10,
          //                               ),
          //                               Column(
          //                                 children: [
          //                                   Text(
          //                                     'Mobile',
          //                                     style: TextStyle(
          //                                         fontWeight: FontWeight.bold),
          //                                   ),
          //                                   Container(
          //                                     height: 100,
          //                                     width: 110,
          //                                     child: ListView.builder(
          //                                       // shrinkWrap: true,
          //                                       itemCount: mobileNumbers.length,
          //                                       itemBuilder: ((context,
          //                                               index) =>
          //                                           Padding(
          //                                             padding: const EdgeInsets
          //                                                 .fromLTRB(0, 5, 0, 5),
          //                                             child: GestureDetector(
          //                                               onTap: () {
          //                                                 String cickedMNumber =
          //                                                     mobileNumbers[
          //                                                         index];
          //                                                 openPhoneDialer(
          //                                                     cickedMNumber);
          //                                               },
          //                                               child: Text(
          //                                                 mobileNumbers[index],
          //                                                 style: TextStyle(
          //                                                   // color: baseColor,
          //                                                   fontSize: 14,
          //                                                 ),
          //                                               ),
          //                                             ),
          //                                           )),
          //                                     ),
          //                                   )
          //                                 ],
          //                               ),
          //                             ],
          //                           )
          //                         ],
          //                       );
          //                     }),
          //               ))
          //         ]),
          //       ),
          //     ),
          //   ),
          // )
          // SliverToBoxAdapter(
          //   child: Expanded(
          //     child: Container(
          //      child: Column(
          //       children: [
          //         ListTile(

          //         )
          //       ],
          //      ),

          //     ),
          //   )
          // )
          SliverToBoxAdapter(
            child: FutureBuilder<List<Business>>(
                future: getCompanyDetail(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CompanyInfoShimmer();
                  }
                  companyDetailData = snapshot.data;

                  List<String> mobileNumbers =
                      companyDetailData?.first.mobile?.split(';') ?? [];
                  List<String> officeNumbers =
                      companyDetailData?.first.office?.split(';') ?? [];

                  print("company detail data $companyDetailData");
                  if (snapshot.hasData) {
                    return Container(
                      height: MediaQuery.sizeOf(context).height * 0.89,
                      width: double.infinity,
                      color: Theme.of(context).backgroundColor,

                      // decoration: BoxDecoration(
                      //     // color: Color.fromRGBO(230, 240, 236, 1),
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(50),
                      //       topRight: Radius.circular(50),
                      //     ),
                      //     ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50.0, 10, 20, 0),
                            child: Center(
                              child: Text(
                                companyDetailData!.first.businessName ?? '',
                                // "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          //SHOW MAIN OR SHORT DESCRIPTION IF BOTH OF THEM ARE EMPTY DISPLAY EMPTY CONTAIENR
                          (companyDetailData?.first.mainDescription == '' &&
                                  companyDetailData?.first.shortDescription ==
                                      '')
                              ? Container(
                                  width: 1,
                                  height: 1,
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // padding: EdgeInsets.all(5),
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(10),
                                    //     border: Border.all(color: Colors.grey)),
                                    child: Html(
                                      data: companyDetailData
                                              ?.first.mainDescription ??
                                          companyDetailData
                                              ?.first.shortDescription ??
                                          '',
                                    ),
                                  ),
                                ),
                          Divider(
                              // color: Colors.black,
                              ),
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 10.0),
                          //   child: Container(
                          //     height: 70,
                          //     padding: EdgeInsets.all(8),
                          //     width: double.infinity,
                          //     // color: Colors.grey[300],
                          //     child: Center(
                          //       child: Text(
                          //         'CONTACT INFORMATION',
                          //         style: GoogleFonts.roboto(
                          //           color: Color.fromRGBO(3, 166, 120, 1),
                          //           fontSize: 22,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Divider(
                            height: 1,
                            thickness: 2,
                            color: blackColor,
                          ),
                          Expanded(
                            // height: MediaQuery.of(context).size.height * 0.6,
                            // flex: 2,
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                //mobile code
                                // companyDetailData?.first.mobile == ''
                                // ? Container(
                                //     width: 5,
                                //     height: 5,
                                //   )
                                ListTile(
                                  leading: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          color: blackColor,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Mobile: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: Container(
                                    height: mobileNumbers.length * 30,
                                    child: ListView.builder(
                                        itemCount: mobileNumbers.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                openPhoneDialer(
                                                    mobileNumbers[index]);
                                              },
                                              child: Text(
                                                style: TextStyle(
                                                    color: Colors.blue),
                                                mobileNumbers[index],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  // title: Text(
                                  //   textAlign: TextAlign.center,

                                  //   companyDetailData?.first.mobile ?? "",

                                  //   // '091231212',
                                  //   style: TextStyle(
                                  //     letterSpacing: 1,
                                  //   ),
                                  // ),
                                  trailing: CustomButton(
                                    callbackAction: () {
                                      openPhoneDialer(mobileNumbers.first);
                                    },
                                    buttonText: 'Call',
                                    width: 70,
                                    height: 30,
                                    buttonColor: baseColor,
                                    textColor: blackColor,
                                  ),
                                ),
                                Divider(
                                    height: 1,
                                    color: blackColor,
                                    thickness: 0.3),
                                // companyDetailData?.first.office == ''
                                //     ? Container(
                                //         height: 1,
                                //         width: 1,
                                //       )
                                ListTile(
                                  leading: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          color: blackColor,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Telephone: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // title: Text(
                                  //   companyDetailData?.first.office ??
                                  //       '',
                                  // ),
                                  title: Container(
                                    height: officeNumbers.length * 25,
                                    child: ListView.builder(
                                        itemCount: mobileNumbers.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                openPhoneDialer(
                                                    officeNumbers[index]);
                                              },
                                              child: Text(
                                                style: TextStyle(
                                                    color: Colors.blue),
                                                officeNumbers[index],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  trailing: CustomButton(
                                    callbackAction: () {
                                      openPhoneDialer(
                                          companyDetailData?.first.office ??
                                              '');
                                    },
                                    buttonText: 'Call',
                                    width: 70,
                                    height: 30,
                                    buttonColor: baseColor,
                                    textColor: blackColor,
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 0.3,
                                  color: blackColor,
                                ),

                                ListTile(
                                  //showing leading and trailing based on presence of the data
                                  leading:
                                      // companyDetailData?.first.website == ''
                                      // ?Container(
                                      //     width: 1,
                                      //     height: 1,
                                      Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: blackColor,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Email: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Icon(Icons.language, color: blackColor),

                                  title: Text(
                                    companyDetailData?.first.email ?? '',

                                    // 'www.moniza.et.com',
                                    style: TextStyle(),
                                  ),
                                  trailing:
                                      // companyDetailData?.first.website == ''
                                      // ? Container(
                                      //     width: 10,
                                      //   )
                                      CustomButton(
                                    callbackAction: () {
                                      lauchEmail(
                                          companyDetailData?.first.email ?? '');
                                    },
                                    buttonText: 'Email',
                                    width: 70,
                                    height: 30,
                                    buttonColor: baseColor,
                                    textColor: blackColor,
                                  ),
                                ),

                                Divider(
                                  height: 1,
                                  thickness: 0.3,
                                  color: blackColor,
                                ),

                                ListTile(
                                  //showing leading and trailing based on presence of the data
                                  leading:
                                      // companyDetailData?.first.website == ''
                                      // ?Container(
                                      //     width: 1,
                                      //     height: 1,
                                      Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.language,
                                          color: blackColor,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Website: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Icon(Icons.language, color: blackColor),

                                  title: Text(
                                    companyDetailData?.first.website ?? '',

                                    // 'www.moniza.et.com',
                                    style: TextStyle(),
                                  ),
                                  trailing:
                                      // companyDetailData?.first.website == ''
                                      // ? Container(
                                      //     width: 10,
                                      //   )
                                      CustomButton(
                                    callbackAction: () {
                                      var parsedUri = Uri.parse(
                                          companyDetailData?.first.website ??
                                              "");
                                      print(companyDetailData?.first.website);
                                      _launchUrl(
                                          companyDetailData?.first.website ??
                                              '');
                                    },
                                    buttonText: 'visit',
                                    width: 70,
                                    height: 30,
                                    buttonColor: baseColor,
                                    textColor: blackColor,
                                  ),
                                ),

                                Divider(
                                  height: 1,
                                  thickness: 0.3,
                                  color: blackColor,
                                ),

                                ListTile(
                                  //showing leading and trailing based on presence of the data
                                  leading:
                                      // companyDetailData?.first.website == ''
                                      // ?Container(
                                      //     width: 1,
                                      //     height: 1,
                                      Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: blackColor,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Address: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Icon(Icons.language, color: blackColor),

                                  title: Text(
                                    companyDetailData?.first.address ?? '',

                                    // 'www.moniza.et.com',
                                    style: TextStyle(),
                                  ),
                                  // trailing:
                                  // companyDetailData?.first.website == ''
                                  // ? Container(
                                  //     width: 10,
                                  //   )
                                  //     CustomButton(
                                  //   callbackAction: () {
                                  //     lauchEmail(
                                  //         companyDetailData?.first.email ?? '');
                                  //   },
                                  //   buttonText: 'Email',
                                  //   width: 70,
                                  //   height: 30,
                                  //   buttonColor: baseColor,
                                  //   textColor: blackColor,
                                  // ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),

          SliverToBoxAdapter(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Photos',
                    style: GoogleFonts.italiana(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                FutureBuilder<List<Verifiedbusiness>>(
                    // future: getVerifiedbusiness(),
                    builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return shimmerLoadingFeatured();
                  }
                  List<Verifiedbusiness> verifiedBusinessList =
                      snapshot.data ?? [];
                  // print(verifiedBusinessList.first.nm);
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                    child: Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(10, (index) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0), //pading between containers
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.grey
                                    //   color: Color.fromRGBO(226, 229, 210, 1)
                                    //   color: Color.fromRGBO(215, 220, 222, 1),
                                    //   color: Color.fromRGBO(57, 74, 89, 1),
                                    color: Color.fromRGBO(215, 215, 215, 1)),
                                width: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image(
                                          image:
                                              AssetImage('assets/addisbiz.jpg'),
                                          // height: 150,
                                          // width: 200,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        }),
                      ),
                    ),
                  );
                })
              ],
            ),
          ))
          //  Container()
        ],
      ),
    );
  }

  // FutureBuilder<List<Business>>(
  //   future: getCompanyDetail(),
  //   builder: (context, sanpshot) {
  //     if (sanpshot.hasData) {
  //       List<Business> companyDetailData = sanpshot.data!;
  //       List<String> officeNumbers =
  //           companyDetailData.first.office?.split(';') ?? [];
  //       print(officeNumbers);

  //       var parsedUri = Uri.parse(companyDetailData.first.website ?? '');
  //       return Column(
  //         children: [
  //           Expanded(
  //             child: Container(
  //               width: double.infinity,
  //               height: MediaQuery.sizeOf(context).height * 0.2,
  //               decoration: BoxDecoration(),
  //               child: Image(
  //                 image: AssetImage('assets/addisbiz.jpg'),
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             height: MediaQuery.sizeOf(context).height * 0.7,
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //                 color: Theme.of(context).backgroundColor,
  //                 // color: Color.fromRGBO(230, 240, 236, 1),
  //                 borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(50),
  //                   topRight: Radius.circular(50),
  //                 )),
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 18.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(50.0, 10, 20, 10),
  //                     child: Center(
  //                       child: Text(
  //                         companyDetailData.first.businessName ??
  //                             ''
  //                                 "",
  //                         // "",
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Divider(
  //                     color: Colors.black,
  //                   ),
  //                   Container(
  //                     height: MediaQuery.of(context).size.height * 0.3,
  //                     child: ListView(
  //                       children: [
  //                         //mobile code
  //                         ListTile(
  //                             leading: companyDetailData.first.mobile == ''
  //                                 ? Container(
  //                                     width: 10,
  //                                   )
  //                                 : Icon(Icons.phone_android,
  //                                     color: baseColor),
  //                             title: Text(
  //                               companyDetailData.first.mobile ??
  //                                   "will provide phone number soon",

  //                               // '091231212',
  //                               style: TextStyle(
  //                                 letterSpacing: 1,
  //                               ),
  //                             ),
  //                             trailing: companyDetailData.first.mobile == ''
  //                                 ? Container(
  //                                     width: 10,
  //                                   )
  //                                 : CustomButton(
  //                                     callbackAction: () {
  //                                       openPhoneDialer(companyDetailData
  //                                               .first.mobile ??
  //                                           '');
  //                                     },
  //                                     buttonText: 'Call',
  //                                     width: 70,
  //                                     height: 30,
  //                                     buttonColor: baseColor,
  //                                     textColor: blackColor,
  //                                   )),

  //                         companyDetailData.first.office == ''
  //                             ? Container(
  //                                 height: 1,
  //                                 width: 1,
  //                               )
  //                             : ListTile(
  //                                 leading: Image(
  //                                   image: AssetImage(
  //                                       'assets/icons/oldphone.png'),
  //                                   width: 23,
  //                                   height: 24,
  //                                 ),
  //                                 title: Text(
  //                                   companyDetailData.first.office ?? '',
  //                                 ),
  //                               ),

  //                         ListTile(
  //                           //showing leading and trailing based on presence of the data
  //                           leading: companyDetailData.first.website == ''
  //                               ? Container(
  //                                   width: 10,
  //                                 )
  //                               : Icon(Icons.language, color: baseColor),

  //                           title: Text(
  //                             companyDetailData.first.website ?? '',

  //                             // 'www.moniza.et.com',
  //                             style: TextStyle(),
  //                           ),
  //                           trailing: companyDetailData.first.website == ''
  //                               ? Container(
  //                                   width: 10,
  //                                 )
  //                               : CustomButton(
  //                                   callbackAction: () {
  //                                     _launchUrl(parsedUri);
  //                                   },
  //                                   buttonText: 'vist',
  //                                   width: 70,
  //                                   height: 30,
  //                                   buttonColor: baseColor,
  //                                   textColor: blackColor,
  //                                 ),
  //                         ),
  //                         ListTile(),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           )
  //         ],
  //       );
  //     } else {
  //       return Text('Loading...');
  //     }
  //   },
  // ),
  // );
  // }

//   Future<List<Business>> getCompanyDetail() async {
//     try {
//       var uri = Uri.parse(
//           'https://addisbiz.com/business-directory/api/v1/business_directory_company?id=$businessId');
//       var response = await http.get(uri);
//       if (response.statusCode == 200) {
//         var jsonBody = response.body;
//         var body = jsonDecode(jsonBody);
//         print('body indside z funcion==>>>$body');
//         if (body['business'] != null) {
//           var detailList = body['business'];
//           return (detailList as List)
//               .map((json) => Business.fromJson(json ?? {}))
//               .toList();
//         } else {
//           throw Exception('No businessdetail  data found');
//         }
//       }
//     } catch (e) {
//       throw Exception('Error occured on getCompanyDetailFucntion $e');
//     }
//     return [];
//   }

//
}

Future<List<Business>> getCompanyDetail() async {
  try {
    var uri =
        ('https://addisbiz.com/business-directory/api/v1/business_directory_company?id=$businessId');
    var companyUri = Uri.parse(uri);
    // print('COMPANY URI=====>>>>$companyUri');

    // var companyUritry = Uri.parse(uri);

    var response = await http.get(companyUri);
    if (response.statusCode == 200) {
      var jsonBody = response.body;
      var jsonDecoded = jsonDecode(jsonBody);
      print('Json decoded=============>$jsonDecoded');

      if (jsonDecoded['business'] != null) {
        var jsonObject = jsonDecoded['business'];
        print('Json as List ==>$jsonObject');

        if (jsonObject is Map<String, dynamic>) {
          var jsonList = [jsonObject];
          print(
              'json object after changed to list=========================================>$jsonList');

          return jsonList.map((json) => Business.fromJson(json)).toList();
        } else {
          throw Exception('Json is in unexpected format');
        }
      } else {
        throw Exception(
            'No business data found (in companydetail) business is null');
      }
    } else {
      // Handle the case when the API request fails
      throw Exception('Failed to fetch company datadetail');
    }
  } catch (e) {
    print('Error in getCompanyDatadetail(): $e');
    throw e;
  }
}
