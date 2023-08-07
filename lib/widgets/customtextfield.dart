import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String?hintText;
   CustomTextField({super.key,this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black12)
        ),
        child: TextFormField(

             decoration: InputDecoration(
               hintText: hintText,

               icon: Icon(
                 Icons.search,
               ),
               border: InputBorder.none

             ),
        ),
      ),
    );
  }
}
