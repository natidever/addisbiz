import 'package:flutter/material.dart';
import 'package:addisbiz/constants.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

import '../entites/data.dart';
import 'customtextfield.dart';
import 'package:addisbiz/entites/api.dart';
import 'package:shimmer/shimmer.dart';

List<Data> resourceList = [
  Data(sectorIcon: 'assets/icons/fast-food.png', route: "/companylist"),
  Data(sectorIcon: 'assets/icons/health.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/construction.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/health.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/fast-food.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/health.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/construction.png', route: "/page1"),
  Data(sectorIcon: 'assets/icons/health.png', route: "/page1"),
  Data(
      businessSectorName: "Agriculture",
      sectorIcon: 'assets/icons/fast-food.png',
      route: "/page1"),
  Data(
      businessSectorName: "Automotive",
      sectorIcon: 'assets/icons/health.png',
      route: "/page1"),
  Data(
      businessSectorName: "Construction and promotion",
      sectorIcon: 'assets/icons/construction.png',
      route: "/page1"),
  Data(
      businessSectorName: "Education",
      sectorIcon: 'assets/icons/health.png',
      route: "/page1"),
  Data(
      businessSectorName: "Agriculture",
      sectorIcon: 'assets/icons/fast-food.png',
      route: "/page1"),
  Data(
      businessSectorName: "Automotive",
      sectorIcon: 'assets/icons/health.png',
      route: "/page1"),
  Data(
      businessSectorName: "Construction and promotion",
      sectorIcon: 'assets/icons/construction.png',
      route: "/page1"),
  Data(
      businessSectorName: "Education",
      sectorIcon: 'assets/icons/health.png',
      route: "/page1"),
];

loadingSkimmer() {
  return Shimmer.fromColors(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            // List<Child> subCategoryName = fullData[index].children!;
            return Container(
              width: 70,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).backgroundColor,
              ),
            );
          },
          itemCount: 15),
    ),
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
  );
}

class ScreenDesign extends StatefulWidget {
  ScreenDesign({
    this.slivers,
    this.routeName,
  });

  final List<Widget>? slivers;
  String? routeName;
  @override
  State<ScreenDesign> createState() => _ScreenDesignState();
}

final scaffoldKey = GlobalKey<ScaffoldState>();

class _ScreenDesignState extends State<ScreenDesign> {
  @override
  Widget build(BuildContext context) {
    // final List<Child>? children = ModalRoute.of(context)!.settings.arguments as List<Child>?;
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<Child> children = arguments['children'];
    var categoryAlies = arguments['parentAlias'];
    var subCategoryIcon = arguments['icon'];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //slider
          SliverAppBar(
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
          //-============--//=== SEARCH=-=-=-=========================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: CustomTextField(
                hintText: "Search any business here ...",
              ),
            ),
          ),
          //==////------------------------GRID==--==============

          SliverToBoxAdapter(
            child: FutureBuilder<List<Data>>(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loadingSkimmer();
                } else if (snapshot.hasError) {
                  return Text("Error");
                }
                if (snapshot.data == null) {
                  return Text("snap shoot is emp");
                }
                if (snapshot.hasData) {
                  // List<Data> fullData = snapshot.data!;

                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          // List<Child> subCategoryName = fullData[index].children!;
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/companylist",
                                  arguments: {
                                    'categoryAlies': categoryAlies,
                                    'subcategory': children[index].alias
                                  });
                            },
                            child: Container(
                              width: 65,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Theme.of(context).backgroundColor,
                                  // color: Colors.grey
                                  // color: Color.fromRGBO(115, 115, 115, 1),
                                  // color: containerColorForSubcategory,
                                  color: containerColors),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          // resourceList[index].sectorIcon ??
                                          //     "Default path"
                                          // 'assets/addisbiz.jpg'
                                          subCategoryIcon),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    children?[index].categoryName ??
                                        "Addis biz",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: children?.length),
                  );
                } else {
                  return Container(
                    child: Center(child: Text("Loading/....")),
                  );
                }
              },
              future: getCategories(),
            ),
          )
        ],

        //gridcategores using future builder
      ),
    );
  }
}
