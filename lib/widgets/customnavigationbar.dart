import 'package:addisbiz/constants.dart';
import 'package:addisbiz/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentPage;
  final void Function(int) goTo;
  get currentpage => currentPage;

  const CustomBottomNavigationBar({
    required this.currentPage,
    required this.goTo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 80,
      child: GNav(
        tabBorderRadius: 50,
        activeColor: baseColor,
        tabBackgroundColor: Color.fromRGBO(25, 25, 25, 1),
        padding: EdgeInsets.all(11),
        onTabChange: (index) {
          goTo(index);
        },
        tabs: [
          GButton(
            active: currentPage == 0,
            borderRadius: BorderRadius.circular(50),
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            active: currentPage == 1,
            icon: Icons.category,
            text: "Categories",
          ),
          // GButton(
          //   active: currentPage == 2,
          //   icon: Icons.featured_play_list,
          //   text: "Featured",
          // ),
        ],
      ),
    );
  }
}
