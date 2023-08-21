import 'package:addisbiz/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String?hintText;
  Color?hintTextColor;
  Color?textFieldColor;
   CustomTextField({this.hintText,this.hintTextColor,this.textFieldColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,

        child: TextFormField(
             decoration: InputDecoration(
               contentPadding:EdgeInsets.only(top: 10),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,

               ),
               prefixIcon: Container(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal:6.0),
                   child: Icon(
                     Icons.search,
                     color: Colors.grey,
                   ),
                 ),
               ),
               fillColor: Theme.of(context).secondaryHeaderColor,
               filled: true,
               hintText: hintText,

               hintStyle: TextStyle(
                 color: Colors.grey,
               ),
               suffixIcon: Icon(
                 Icons.clear,
               color: Colors.grey,),



             ),
        ),
    );
  }
}
