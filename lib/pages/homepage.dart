import 'package:addisbiz/themes/change_theme_button_widget.dart';
import 'package:addisbiz/themes/light_them.dart';
import 'package:addisbiz/themes/theme_provider.dart';
import 'package:addisbiz/widgets/customtextfield.dart';
import 'package:addisbiz/widgets/modifiedtextwidget.dart';
import 'package:flutter/material.dart';
import 'package:addisbiz/widgets/navbar.dart';
import 'package:addisbiz/constants.dart';
import 'package:addisbiz/entites/data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../themes/dark_them.dart';
import '../widgets/button.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

List<Data> resourceList = [
  Data(
      businessSectorName: "Accommodation",
      sectorIcon: 'assets/icons/advert.png',
      route: "/page1"),
  Data(
      businessSectorName: "Agriculture",
      sectorIcon: 'assets/icons/agriculture.png',
      route: "/page1"),
  Data(
      businessSectorName: "Automotive",
      sectorIcon: 'assets/icons/automotive.png',
      route: "/page1"),
  Data(
      businessSectorName: "Construction and promotion",
      sectorIcon: 'assets/icons/construction.png',
      route: "/page1"),
  Data(
      businessSectorName: "Education",
      sectorIcon: 'assets/icons/advert.png',
      route: "/page1"),
  Data(
      businessSectorName: "Accommodation",
      sectorIcon: 'assets/icons/business.png',
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            // statusBarColor:  Theme.of(context).appBarTheme.backgroundColor,


          ),

          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                 child: CustomTextField(
                hintText: "Search in categories",
                hintTextColor: Colors.grey,


              ),
            )),
          ),
          actions: [
               // ChangeThemeButtonWidget(),

            // Builder(
            //   builder: (context) {
            //     final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
            //     return IconButton(
            //       onPressed: () {
            //         print("clicked");
            //         if (themeProvider.getThemeMode == ThemeMode.dark) {
            //           themeProvider.setTheme(ThemeMode.light);
            //         } else {
            //           themeProvider.setTheme(ThemeMode.dark);
            //         }
            //         print("clicked after");
            //       },
            //       icon: Icon(Icons.brightness_2_sharp),
            //     );
            //   },
            // ),
                          IconButton(

                        onPressed: () {
                          Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
                        },
                            icon:Provider.of<ThemeNotifier>(context).darkTheme
                                ? Icon(Icons.sunny)
                                : Icon(Icons.brightness_2_sharp)

                          ),




            // Padding(
            //   padding: const EdgeInsets.only(right: 10.0),
            //   child: IconButton(
            //     onPressed: () {
            //
            //       final provider = Provider.of<ThemeProvider>(context, listen: false);
            //       provider.toggleTheme(true);
            //
            //     },
            //     icon: Icon(Icons.brightness_2_sharp),
            //   )
            //   ,
            // )
          ],
        ),


        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ModifiedTextWidget(
                        text: "Categories",
                      )),
                  CustomButton(
                    callbackAction: (){},
                    buttonText: "View all",
                    buttonColor: goldenColor,
                    textColor: blackColor,
                    width: 75,
                    height: 30,
                  ),
                ],
              ), //category and view
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 5, 16, 5),
                child: Container(
                  height: 265,



                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: resourceList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {

                          return GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, resourceList[index].route??"page not found");
                              },
                            child: AspectRatio(
                              aspectRatio: 5/7,
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



                                   // SvgPicture.asset(
                                   //     // width:MediaQuery.sizeOf(context).width,
                                   //     // height:MediaQuery.sizeOf(context).height,
                                   //   width:40,
                                   //     height:50,
                                   //     resourceList[index].sectorIcon??"not found"),

                                        Image(
                                          width:50,
                                          height: 50,
                                          image: AssetImage(resourceList[index].sectorIcon??"Default path"),
                                        ),



                                    SizedBox(height: 10),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        resourceList[index].businessSectorName ??
                                            "SectorName",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          );

                      }),
                ),
              ), //end of horizontal slider
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ModifiedTextWidget(
                  text: "Recently added",
                ),
              ),
              ////





              // resently added









              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: ListView.builder(
                  itemCount: 20,
                    shrinkWrap: true,
                     physics: ScrollPhysics(),
                    itemBuilder: (context,builder){
                      return Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 100,
                            color: Theme.of(context).backgroundColor,
                            width: double.infinity,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 10/8,
                                    child: Image(
                                      image: AssetImage('assets/headerimage4.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:10.0),
                                        child: ModifiedTextWidget(text: 'Zsigba software plc',),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:40.0),
                                        child: Divider(
                                          color: Colors.blueGrey,

                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          CustomButton(
                                            callbackAction: (){},
                                            buttonText: "Addis ababa",
                                            buttonColor: Theme.of(context).cardColor,
                                           textColor: Theme.of(context).shadowColor,
                                            width: 89,
                                            height:20,
                                          ),
                                          CustomButton(
                                            callbackAction: (){},
                                            buttonText: "+2519 1337 7471",
                                            buttonColor: Theme.of(context).cardColor,
                                            textColor: Theme.of(context).shadowColor,
                                            width: 150,
                                            height:20,
                                          )

                                        ],
                                      )

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }


                ),
              ),



            ],
          ),

        )


        );
  }
}
