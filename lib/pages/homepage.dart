import 'dart:convert';

import 'package:addisbiz/entites/verifiedbusinesses.dart';
import 'package:addisbiz/widgets/customtextfield.dart';
import 'package:addisbiz/pages/companylist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:addisbiz/widgets/navbar.dart';
import 'package:addisbiz/constants.dart';
import 'package:addisbiz/entites/data.dart';
import 'package:flutter/services.dart';
import '../entites/api.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

List<Data> resourceList = [
  Data(sectorIcon: 'assets/icons/export.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/tour.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/import.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/construction.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/suppliers.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/business.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/ngo (1).png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/education.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/automotive.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/family.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/ict.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/advert.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/fast-food.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/meeting.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/agriculture.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/transportation.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/hospitality.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/shopping-cart.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/health.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/factory.png', route: "/page1"),
];

final scaffoldKey = GlobalKey<ScaffoldState>();

shimmerLoading() {
  return Shimmer.fromColors(
    child: GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 5 / 7,
          child: Container(
            decoration: BoxDecoration(
              //================
              color: Theme.of(context).backgroundColor,
              //===================================
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      itemCount: 9,
    ),
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
  );
}

shimmerLoadingFeatured() {
  return Shimmer.fromColors(
    child: Container(
      width: double.infinity,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                //================
                color: Theme.of(context).backgroundColor,
                //===================================
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
          itemCount: 9,
        ),
      ),
    ),
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
  );
}

Widget horizontalScrollCards(BuildContext context) {
  // debugPrint("horizontalScrollCards called");
  List<Data> categoryList = [];
  return Container(
    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
    height: 265,
    child: FutureBuilder<List<Data>>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // debugPrint("Waiting state ");

          return shimmerLoading();
        }
        if (snapshot.hasData) {
          // debugPrint("Future got the snapshot data ");
          categoryList = snapshot.data!;
          return GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              // debugPrint("Before Future ");
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/page1", arguments: {
                    'children': categoryList[index].children,
                    'parentAlias': categoryList[index].alias,
                    'icon': resourceList[index].sectorIcon,
                  });
                },
                child: AspectRatio(
                  aspectRatio: 5 / 7,
                  child: Container(
                    // height: itemHeight,
                    // width: itemWidth,
                    decoration: BoxDecoration(
                      //================
                      color: Theme.of(context).backgroundColor,
                      //===================================
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          width: 50,
                          height: 50,
                          image: AssetImage(
                            resourceList[index].sectorIcon ?? "Default path",
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            categoryList[index].businessSectorName ??
                                "Addis Biz",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: snapshot.data!.length,
          );
        } else if (snapshot.hasError) {
          print("error has ===========================================");
          return Text("error .=========================================..");
        } else {
          return Container(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.yellow,
            ),
          );
        }
      },
      future: getCategories(),
    ),
  );
}

// Widget NewlyAddedCards(BuildContext context){
//   return FractionallySizedBox(
//     widthFactor: 0.2,
//     heightFactor: 0.4,
//     child: Container(
//       color: Colors.purple,
//     ),
//   );
// }
ScrollController _scrollController = ScrollController();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: baseColor // Set the desired color
                ));
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Color.fromRGBO(255, 254, 254, 1),
        ));
      }
    });
    getCategories();
    getVerifiedbusiness();

    // Add your initialization code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      key: scaffoldKey,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 0.0,
              // backgroundColor: Color.fromRGBO(250, 235, 215, 1),

              // backgroundColor: Colors.black,
              backgroundColor: baseColor,

              leading: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: IconButton(
                  icon: Image.asset(
                    'assets/icons/menu (1).png',
                  ),
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer(); // Open the drawer
                  },
                ),
              ),

              expandedHeight: 350,

              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: AnotherCarousel(
                      animationCurve: Curves.linear,
                      autoplayDuration: Duration(seconds: 2),
                      indicatorBgPadding: 4,
                      dotBgColor: Colors.transparent,
                      boxFit: BoxFit.fill,
                      showIndicator: false,
                      dotSize: 2,
                      images: [
                        AssetImage('assets/addisbiz.jpg'),
                        AssetImage('assets/addisbiz.jpg'),
                        AssetImage('assets/headerimage.jpg'),
                      ]),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: CustomTextField(
                  hintText: "Search any business here ...",
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: horizontalScrollCards(context),
              // child: Text("debugging message"),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 29, 0, 0),
              child: Text(
                "Featured",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            )),
            SliverToBoxAdapter(
              child: FutureBuilder<List<Verifiedbusiness>>(
                  future: getVerifiedbusiness(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return shimmerLoadingFeatured();
                    }
                    List<Verifiedbusiness> verifiedBusinessList =
                        snapshot.data ?? [];
                    // print(verifiedBusinessList.first.nm);
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        height: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(10, (index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        8.0), //pading between containers
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.grey
                                      //   color: Color.fromRGBO(226, 229, 210, 1)
                                      //   color: Color.fromRGBO(215, 220, 222, 1),
                                      //   color: Color.fromRGBO(57, 74, 89, 1),
                                      color: Color.fromRGBO(215, 215, 215, 1)),
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(0),
                                          bottomLeft: Radius.circular(0),
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        ),
                                        child: Image(
                                          image:
                                              AssetImage('assets/addisbiz.jpg'),
                                          height: 150,
                                          width: 200,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          // "Nazarawit plastic manufacturing plc and other incubat ",
                                          verifiedBusinessList[index].nm,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color:
                                                Color.fromRGBO(50, 50, 50, 1),
                                            // color: baseColor
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          }),
                        ),
                      ),
                    );
                  }),
            ), //sliver of featured

            SliverPadding(padding: EdgeInsets.only(bottom: 40)),

            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: Text(
                "Newly added",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            )),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 50),
                child: FutureBuilder<List<Verifiedbusiness>>(
                    future: getVerifiedbusiness(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return shimmerLoadingFeatured();
                      }
                      List<Verifiedbusiness> verifiedBusinessList =
                          snapshot.data ?? [];
                      // print(verifiedBusinessList.first.nm);
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          height: 250,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(10, (index) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal:
                                          8.0), //pading between containers
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        // color: Colors.grey
                                        //   color: Color.fromRGBO(226, 229, 210, 1)
                                        //   color: Color.fromRGBO(215, 220, 222, 1),
                                        //   color: Color.fromRGBO(57, 74, 89, 1),
                                        color:
                                            Color.fromRGBO(215, 215, 215, 1)),
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(0),
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/addisbiz.jpg'),
                                            height: 150,
                                            width: 200,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            // "Nazarawit plastic manufacturing plc and other incubat ",
                                            verifiedBusinessList[index].nm,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color:
                                                  Color.fromRGBO(50, 50, 50, 1),
                                              // color: baseColor
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            }),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );

    // return   Scaffold(
    //   drawer: NavBar(),
    //   body: SafeArea(
    //     child: CustomScrollView(
    //       slivers: [
    //
    //         SliverPersistentHeader(
    //           delegate: CustomSliverAppBarDelegate(expandedHeight: 200),
    //           pinned: true,
    //         ),
    //
    //         SliverList(
    //           delegate: SliverChildListDelegate(
    //             [
    //               Container(
    //                 color: Colors.red,
    //                 height: 100,
    //               ),
    //               Container(
    //                 color: Colors.blue,
    //                 height: 100,
    //               ),
    //               Container(
    //                 color: Colors.green,
    //                 height: 100,
    //               ),
    //             ],
    //           ),
    //         )
    //
    //
    //       ],
    //     ),
    //   ),
    // );
  }

  Future<List<Verifiedbusiness>> getVerifiedbusiness() async {
    List<Verifiedbusiness> verfiedBusinesses = [];
    try {
      var categoriesURL = Uri.parse(
          "https://addisbiz.com/business-directory/api/v1/business_directory_verified_businesses");
      var response = await http.get(categoriesURL);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        var body = json.decode(jsonBody);
        // print('body=====> $body');

        // print(body['categories']);

        verfiedBusinesses = List<Verifiedbusiness>.from(
            body["verifiedbusinesses"]
                .map((json) => Verifiedbusiness.fromJson(json)));
      } else {
        print("Error occurred veridied business: ${response.statusCode}");
        print("Error body: ${response.body}");
      }
    } catch (e) {
      // print('error in getVerifiedBusiness $e');
    }
    // print('verified businesses =================>  $verfiedBusinesses');
    return verfiedBusinesses;
  }
}

// class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double? expandedHeight;
//
//   const CustomSliverAppBarDelegate({
//      this.expandedHeight,
//   });
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final size = 60;
//     final top = 220;
//
//     return Stack(
//       fit: StackFit.expand,
//
//       children: [
//         AppBar(
//
//           leading: Padding(
//             padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
//             child: IconButton(
//               icon: Image.asset(
//                 'assets/icons/menu (1).png',
//               ),
//               onPressed: () {
//                 scaffoldKey.currentState!.openDrawer();// Open the drawer
//               },
//             ),
//           ),
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(200),
//             child: AnotherCarousel(
//               animationCurve: Curves.linear,
//               autoplayDuration: Duration(seconds: 2),
//               indicatorBgPadding: 4,
//               dotBgColor: Colors.transparent,
//               boxFit: BoxFit.contain,
//               showIndicator: false,
//               dotSize: 2,
//               images: [
//                 AssetImage('assets/headerimage.jpg'),
//                 AssetImage('assets/headerimage.jpg'),
//                 AssetImage('assets/headerimage.jpg'),
//               ],
//             ),
//           ),
//         ),
//
//         Positioned(
//           top: 200,
//           left: 20,
//           right: 20,
//           child: Container(
//             child: CustomTextField(),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   // TODO: implement maxExtent
//   double get maxExtent => 422;
//
//   @override
//   // TODO: implement minExtent
//   double get minExtent => 233;
//
//   @override bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// }
