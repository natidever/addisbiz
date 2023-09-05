import 'package:addisbiz/constants.dart';
import 'package:addisbiz/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../entites/companydata.dart';
import 'accomodation.dart';
import 'companylist.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  int currentPage = 0;
  late PageController pageController;

  void goTo() {
    if (pageController.hasClients) {
      pageController.jumpToPage(currentPage);
    }
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      goTo();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(242, 232, 95, 1),
      bottomNavigationBar:  Container(
        padding: EdgeInsets.all(10),
        height: 80,
        child: GNav(

          tabBorderRadius: 50,
            activeColor: baseColor,
              tabBackgroundColor:Color.fromRGBO(25, 25, 25, 1),
              // tabBackgroundColor:Colors.black,
          padding: EdgeInsets.all(11),

          onTabChange: (index) {
            setState(() {
              currentPage = index;
            });
            goTo();
          },
          tabs: [
            GButton(
              active: true,
              borderRadius: BorderRadius.circular(50),

              icon: Icons.home,
              text: "Home",

            ),
            GButton(
              icon: Icons.category,
              // iconColor: baseColor,
              text: "Categories",
            ),
            GButton(
              icon: Icons.featured_play_list,
              text: "Featured",

            ),
          ],
        ),
      ),
      body: PageView(
        onPageChanged: onPageChanged,
        controller: pageController,
        children: [
          HomePage(),
          CompanyList(),

        ],
      ),

    );

  }
}









