import 'package:flutter/material.dart';
import 'package:calculator_app/constants/constants.dart';
import 'package:calculator_app/buttons/my_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> buttons = [
  'AC', 'DEL', '%', '/',
  '7', '8', '9', 'x',
  '4', '5', '6', '-',
  '1', '2', '3', '+',
  '0', '.', '=',
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: buttons.length, 
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return MyButton(color: checkTypeOfButton(buttons[index]), textColor: numberTextColor, buttonText: buttons[index], buttonTapped: () {});
              },
            ),
          ),
        ],
      ),
    );
  }


  Color checkTypeOfButton(String buttonText) {
    print(buttonText);
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
