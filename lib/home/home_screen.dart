import 'package:flutter/material.dart';
import 'package:calculator_app/constants/constants.dart';
import 'package:calculator_app/buttons/my_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(),
    );
  }


  Color checkTypeOfButton(String buttonText) {
    if(buttonText == '+' || buttonText == '-' || buttonText == 'x' || buttonText == '/' || buttonText == '=') {
      return operatorButtonColor;
    }
    else if(buttonText == 'AC' || buttonText == 'DEL' || buttonText == '%') {
      return funcButtonColor;
    }
    else {
      return numberButtonColor;
    }
  }
}
