import 'package:addisbiz/constants.dart';
import 'package:addisbiz/pages/homepage.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  // final scaffoldKeys = GlobalKey<ScaffoldState>();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/addisbiz.jpg'),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/HomePage');
              // scaffoldKeys.currentState?.closeDrawer();
              scaffoldKey.currentState?.closeDrawer();
              // Navigator.pop(context);
            },
            iconColor: baseColor,
            textColor: baseColor,
            leading: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 20),
            ),
            selectedColor: baseColor,
          ),
          ListTile(
            onTap: () => {
              Navigator.pushNamed(context, '/category'),
              scaffoldKey.currentState?.closeDrawer()
            },
            leading: Icon(
              Icons.category_outlined,
              size: 30,
            ),
            title: Text(
              'category',
              style: TextStyle(fontSize: 20),
            ),
            selectedColor: baseColor,
          )
        ],
      ),
    );
  }
}

// class WaveClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//
//     var path = new Path();
//     path.lineTo(0, size.height); //start path with this if you are making at bottom
//
//     var firstStart = Offset(size.width / 5, size.height);
//     //fist point of quadratic bezier curve
//     var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
//     //second point of quadratic bezier curve
//     path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
//
//     var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
//     //third point of quadratic bezier curve
//     var secondEnd = Offset(size.width, size.height - 20);
//     //fourth point of quadratic bezier curve
//     path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
//
//     path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false; //if new instance have different instance than old instance
//     //then you must return true;
//   }
// }
