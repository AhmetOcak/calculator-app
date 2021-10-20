import 'package:calculator_app/constants/constants.dart';
import 'package:flutter/material.dart';

class MyZeroButton extends StatelessWidget {
  
  final Color color;
  final Color textColor = numberTextColor;
  final String buttonText;
  final VoidCallback buttonTapped;

  const MyZeroButton({required this.color, required this.buttonText, required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: buttonTapped,
      splashColor: splashColor,
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height / 11,
          minWidth: MediaQuery.of(context).size.width / 2.5,
      ),
      child: Center(
        child: Text(  
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      fillColor: color,
    );
  }
}