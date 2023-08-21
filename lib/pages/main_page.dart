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
      bottomNavigationBar: GNav(
        onTabChange: (index) {
          setState(() {
            currentPage = index;
          });
          goTo();
        },
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.category,
            text: "Categories",
          ),
          GButton(
            icon: Icons.featured_play_list,
            text: "Featured",
          ),
        ],
      ),
      body: PageView(
        onPageChanged: onPageChanged,
        controller: pageController,
        children: [
          HomePage(),
          CompanyList(),
          Accomodation(),
        ],
      ),

    );

  }
}









