import 'package:addisbiz/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String?hintText;
   CustomTextField({this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color:containerColor),
        ),
          child: TextFormField(

               decoration: InputDecoration(
                 hintText: hintText,
                 icon: Padding(
                   padding: const EdgeInsets.only(left:6.0),
                   child: Icon(
                     Icons.search,
                     color: containerColor,

                   ),
                 ),
                 border: InputBorder.none

               ),
          ),
      ),
    );
  }
}
