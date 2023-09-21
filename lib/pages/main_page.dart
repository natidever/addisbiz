import 'package:addisbiz/constants.dart';
import 'package:addisbiz/pages/categories.dart';
import 'package:addisbiz/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../entites/companydata.dart';
import '../widgets/customnavigationbar.dart';
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

  void goTo(int index) {
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
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
      goTo(currentPage);
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

      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: currentPage,
        goTo: goTo,
      ),
      body: PageView(
        onPageChanged: onPageChanged,
        controller: pageController,
        children: [
          HomePage(),
          Category(),
          HomePage(),
        ],
      ),
    );
  }
}
