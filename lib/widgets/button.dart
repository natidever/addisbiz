import 'package:flutter/material.dart';
import 'package:addisbiz/constants.dart';
class CustomButton extends StatelessWidget {
  final String?buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback callbackAction;
  final double? width;
  final double? height;

  const CustomButton({super.key,this.buttonText,this.buttonColor, required this.callbackAction, this.textColor, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callbackAction,
      child: Container(
            // width: 75,
            // height: 30,
          width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: buttonColor,
            ),
            child: Center(
              child: Text(
                 textAlign:TextAlign.center,
                "$buttonText",
                style: TextStyle(
                  color: textColor,
                ),
              ),
            )
        ),
    );
  }
}
