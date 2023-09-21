import 'package:addisbiz/constants.dart';
import 'package:flutter/material.dart';

import '../pages/search.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Color? hintTextColor;
  final Color? textFieldColor;
  final ValueChanged<String>? onChanged;
  // final Function ()?onTap;

  CustomTextField({
    this.hintText,
    this.hintTextColor,
    this.textFieldColor,
    this.onChanged,
    // this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: Search());
      },
      child: Container(
          decoration: BoxDecoration(
              color: containerColors, borderRadius: BorderRadius.circular(10)),
          width: 100,
          height: 50,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    "Search any business in Ethiopia..",
                    style: TextStyle(color: Colors.grey),
                  )),
                ),
              )
            ],
          )),
    );
  }
}
