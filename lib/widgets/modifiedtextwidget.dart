import 'package:flutter/material.dart';

class ModifiedTextWidget extends StatelessWidget {

  const ModifiedTextWidget({this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(

      "$text"??"HELLO",

      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
      ),
    );
  }
}
