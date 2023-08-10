import 'package:addisbiz/pages/company.dart';
import 'package:flutter/material.dart';
import 'package:addisbiz/pages/homepage.dart';
import 'package:addisbiz/pages/accomodation.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes:{
    "/page1":(context)=>Accomodation(),
        "/company":(context)=>Company()
      }
    );
  }
}
