import 'package:addisbiz/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import  'package:addisbiz/widgets/navbar.dart';
import 'package:addisbiz/constants.dart';
import 'package:addisbiz/entites/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}


List<Data>resourceList=[
  Data(businessSectorName: "Accommodation",sectorIcon:Icons.ac_unit,route: "/page1" ),
  Data(businessSectorName: "Adevertising",sectorIcon:Icons.ac_unit,route: "/pa" ),
  Data(businessSectorName: "Agriculture",sectorIcon:Icons.access_alarm,route: "/pa" ),
  Data(businessSectorName: "Automtive Solution",sectorIcon:Icons.back_hand,route: "/pa" ),
  Data(businessSectorName: "Importers",sectorIcon:Icons.account_balance_rounded,route: "/pa" ),
  Data(businessSectorName: "Exportes",sectorIcon:Icons.dark_mode,route: "/pa" ),
  Data(businessSectorName: "Software Solution",sectorIcon:Icons.yard_rounded,route: "/pa" ),
  Data(businessSectorName: "Software Solution",sectorIcon:Icons.ac_unit,route: "/pa" ),
  Data(businessSectorName: "Ict",sectorIcon:Icons.ac_unit,route: "/pa" ),
  Data(businessSectorName: "Webdesign",sectorIcon:Icons.ac_unit,route: "/pa" ),
  Data(businessSectorName: "Mining",sectorIcon:Icons.label,route: "/pa" ),
  Data(businessSectorName: "Splash",sectorIcon:Icons.safety_check,route: "/pa" ),
  Data(businessSectorName: "Accommodation",sectorIcon:Icons.delivery_dining_sharp,route: "/pa" ),
  Data(businessSectorName: "Accommodation",sectorIcon:Icons.golf_course,route: "/pa" ),
  Data(businessSectorName: "Accommodation",sectorIcon:Icons.ac_unit,route: "/pa" ),
  Data(businessSectorName: "Accommodation",sectorIcon:Icons.ac_unit,route: "/pa" ),

];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      drawer: NavBar(),
      body: CustomScrollView(
        slivers: [
          //for the image
          SliverAppBar(
            centerTitle: false,
            expandedHeight: 300,
            pinned: false,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children:[
                  Container(
                    height:400,
                    width: double.infinity,
                    child: Image(
                      image:AssetImage('assets/headerimage6.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 10,

                    child: Column(
                      children: [
                        Text(
                          "Company Brand goes here",
                          // style: TextStyle(
                          //   color: backgroundColor,
                          //   fontWeight: FontWeight.bold,
                          //   fontSize: 30,
                          //   fontFamily: "Roboto-Bold",
                          //
                          // ),
                          style: GoogleFonts.ptSans(
                            fontWeight: FontWeight.bold,
                            color: backgroundColor,
                            fontSize: 30,
                            fontStyle: FontStyle.italic
                          ),
                        ),



                      ],
                    ),
                  )
                ]

              ),
            ),
          ),

          //---search bar--

          SliverAppBar(
            automaticallyImplyLeading: false,
            bottom: PreferredSize(preferredSize:Size.fromHeight(-10),child:SizedBox()),
            // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: backgroundColor,
            elevation: 0,
            pinned: true,
            flexibleSpace: CustomTextField(
              hintText: "Search",
            ),
          ),



          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                     Navigator.pushNamed(context,  resourceList[index].route??"page Not found");
                    },
                    child: Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                        // color: containerColor,
                        gradient: LinearGradient(
                          begin:Alignment.bottomLeft,
                          end:Alignment.topRight,
                          colors: [
                            Color.fromRGBO(2, 89, 89, 1),
                            Color.fromRGBO(3, 140, 127, 1),
                            Color.fromRGBO(86, 191, 172, 1),
                          ]

                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            resourceList[index].sectorIcon,
                            color: Colors.white,
                          ),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              textAlign:TextAlign.center,
                               resourceList[index].businessSectorName??"Sector name",
                              style: TextStyle(
                                color: Colors.white,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: resourceList.length,
            ),
          ),

        ],

      ),




        );
  }
}
