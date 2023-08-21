import 'package:flutter/material.dart';
import 'package:addisbiz/widgets/navbar.dart';
import 'package:addisbiz/constants.dart';
import 'package:addisbiz/entites/data.dart';

import '../widgets/customtextfield.dart';
import '../widgets/modifiedtextwidget.dart';

class Accomodation extends StatefulWidget {
  const Accomodation({Key? key}) : super(key: key);

  @override
  State<Accomodation> createState() => _AccomodationState();
}

List<Data> resourceList = [
  Data(
      businessSectorName: "Agriculture",
      sectorIcon: 'assets/icons/fast-food.png',
      route: "/companylist"),
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
      route: "/page1"),  Data(
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
      route: "/page1"),  Data(
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
      route: "/page1"),  Data(
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

class _AccomodationState extends State<Accomodation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor:  Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          "Sub categories",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifiedTextWidget(
             text: "Name subcategories",
            ),


            SizedBox (height: 15),

            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                 physics: ScrollPhysics(),
                 itemCount: resourceList.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                  ),
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/companylist");
                      },
                      child: Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).backgroundColor,
                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                width:50,
                                height: 50,
                                image: AssetImage(resourceList[index].sectorIcon??"Default path"),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                "Animal food",
                              )
                            ],
                          ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )
    );
  }
}