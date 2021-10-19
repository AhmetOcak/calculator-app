import 'package:flutter/material.dart';
import 'package:calculator_app/constants/constants.dart';
import 'package:calculator_app/buttons/my_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userText = '111';
  String firstText = '421421';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 150,),
                    child: Text(
                      firstText, 
                      style: const TextStyle(fontSize: 45, color: Colors.grey, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      userText, 
                      style: const TextStyle(fontSize: 90, color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      color: funcButtonColor,
                      buttonText: 'C',
                      buttonTapped: () {},
                    ),
                    MyButton(
                      color: funcButtonColor,
                      buttonText: 'DEL',
                      buttonTapped: () {},
                    ),
                    MyButton(
                      color: funcButtonColor,
                      buttonText: '%',
                      buttonTapped: () {},
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: '÷',
                      buttonTapped: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '7',
                      buttonTapped: () {updateUserText('7');},
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '8',
                      buttonTapped: () {updateUserText('8');},
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '9',
                      buttonTapped: () {updateUserText('9');},
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: 'x',
                      buttonTapped: () {updateUserText('x');},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '4',
                      buttonTapped: () {updateUserText('4');},
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '5',
                      buttonTapped: () {updateUserText('5');},
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '6',
                      buttonTapped: () {updateUserText('6');},
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: '-',
                      buttonTapped: () {updateUserText('-');},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '1',
                      buttonTapped: () {updateUserText('1');},
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '2',
                      buttonTapped: () {updateUserText('2');},
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '3',
                      buttonTapped: () {updateUserText('3');},
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: '+',
                      buttonTapped: () {updateUserText('+');},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '0',
                      buttonTapped: () {updateUserText('0');},
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '0',
                      buttonTapped: () {},
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: ',',
                      buttonTapped: () {updateUserText('.');},
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: '=',
                      buttonTapped: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color checkTypeOfButton(String buttonText) {
    if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/' ||
        buttonText == '=') {
      return operatorButtonColor;
    } else if (buttonText == 'AC' || buttonText == 'DEL' || buttonText == '%') {
      return funcButtonColor;
    } else {
      return numberButtonColor;
    }
  }

  void updateUserText(String text) {
    if(textLimitControl()) {
      setState(() {
        userText += text;
      });
    }
  }

  bool textLimitControl(){
    if(userText.length != 8) {
      return true;
    }
    return false;
  }
}
