import 'package:flutter/material.dart';
import 'package:addisbiz/widgets/navbar.dart';
import 'package:addisbiz/constants.dart';
import 'package:addisbiz/entites/data.dart';

import '../widgets/customtextfield.dart';

class Accomodation extends StatefulWidget {
  const Accomodation({Key? key}) : super(key: key);

  @override
  State<Accomodation> createState() => _AccomodationState();
}

List<Data> resourceList = [
  Data(businessSectorName: "Lounges", sectorIcon: Icons.restaurant, route: '/company'),
  Data(businessSectorName: "Cafe", sectorIcon: Icons.local_cafe_rounded, route: "/page1"),
  Data(businessSectorName: "Fast Food", sectorIcon: Icons.fastfood_rounded, route: "/page1"),
  Data(businessSectorName: "Gust House", sectorIcon: Icons.bedroom_parent_outlined, route: "/page1"),
  Data(businessSectorName: "Hotels", sectorIcon: Icons.hotel, route: "/page1"),
  Data(businessSectorName: "Resort", sectorIcon: Icons.eco_rounded, route: "/page1"),
  Data(businessSectorName: "Restaurant", sectorIcon: Icons.restaurant_menu_outlined, route: "/page1"),
  Data(businessSectorName: "Restaurant", sectorIcon: Icons.restaurant_menu_outlined, route: "/page1"),
  Data(businessSectorName: "Restaurant", sectorIcon: Icons.restaurant_menu_outlined, route: "/page1"),
  Data(businessSectorName: "Restaurant", sectorIcon: Icons.restaurant_menu_outlined, route: "/page1"),
  Data(businessSectorName: "Restaurant", sectorIcon: Icons.restaurant_menu_outlined, route: "/page1"),
  Data(businessSectorName: "Restaurant", sectorIcon: Icons.restaurant_menu_outlined, route: "/page1"),
  Data(businessSectorName: "Restaurant", sectorIcon: Icons.restaurant_menu_outlined, route: "/page1"),
  Data(businessSectorName: "Restaurant", sectorIcon: Icons.restaurant_menu_outlined, route: "/page1"),
  Data(businessSectorName: "Restaurant", sectorIcon: Icons.restaurant_menu_outlined, route: "/page1"),
];

class _AccomodationState extends State<Accomodation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // drawer: NavBar(),
      body: CustomScrollView(
        slivers: [
          // For the image
          SliverAppBar(
            centerTitle: false,
            expandedHeight: 300,
            pinned: false,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/headerimage6.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // --- Search bar ---
          SliverAppBar(
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            automaticallyImplyLeading: false,
            bottom: PreferredSize(preferredSize: Size.fromHeight(-10), child: SizedBox()),
            backgroundColor: backgroundColor,
            elevation: 0,
            pinned: true,
            flexibleSpace: CustomTextField(
              hintText: "Search",
            ),
          ),

          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: resourceList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, resourceList[index].route??"page not found");
                  },
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin:Alignment.bottomLeft,
                          end:Alignment.topRight,
                          colors: [
                            Color.fromRGBO(2, 89, 89, 1),
                            Color.fromRGBO(3, 140, 127, 1),
                            Color.fromRGBO(86, 191, 172, 1),
                          ]

                      ),
                    ),
                    child: Card(
                      // color: containerColor,
                      elevation: 13,

                      color: Colors.transparent,

                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ListTile(
                          leading: Icon(
                            resourceList[index].sectorIcon,
                            size: 40,
                            color: backgroundColor,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              resourceList[index].businessSectorName ?? "It is null",
                              style: TextStyle(
                                color: backgroundColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}