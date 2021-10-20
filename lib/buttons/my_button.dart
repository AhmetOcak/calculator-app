import 'package:calculator_app/constants/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  
  final Color textColor = numberTextColor;
  final String buttonText;
  final VoidCallback buttonTapped;

  const MyButton({required this.buttonText, required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: buttonTapped,
      splashColor: splashColor,
      shape: const CircleBorder(),
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height / 10,
          minWidth: MediaQuery.of(context).size.width / 4,
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
      fillColor: checkTypeOfButton(buttonText),
    );
  }
}

Color checkTypeOfButton(String buttonText) {
    if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '÷' ||
        buttonText == '=') {
      return operatorButtonColor;
    } else if (buttonText == 'C' || buttonText == 'DEL' || buttonText == '%') {
      return funcButtonColor;
    } else {
      return numberButtonColor;
    }
  }
