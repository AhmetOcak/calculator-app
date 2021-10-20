import 'package:calculator_app/buttons/my_zero_button.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/constants/constants.dart';
import 'package:calculator_app/buttons/my_button.dart';
import 'package:calculator_app/result screen/result_screen.dart';
import 'package:calculator_app/math operations/calculate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userText = '';
  String tempText = '';
  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ResultScreen(tempText: tempText, userText: userText),
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
                      buttonTapped: () {
                        killText();
                      },
                    ),
                    MyButton(
                      color: funcButtonColor,
                      buttonText: 'DEL',
                      buttonTapped: () {
                        deleteText();
                      },
                    ),
                    MyButton(
                      color: funcButtonColor,
                      buttonText: '%',
                      buttonTapped: () {
                        updateUserText('%');
                        uptateTempText();
                      },
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: '÷',
                      buttonTapped: () {
                        updateUserText('÷');
                        uptateTempText();
                      },
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
                      buttonTapped: () {
                        updateUserText('7');
                      },
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '8',
                      buttonTapped: () {
                        updateUserText('8');
                      },
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '9',
                      buttonTapped: () {
                        updateUserText('9');
                      },
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: 'x',
                      buttonTapped: () {
                        updateUserText('x');
                        uptateTempText();
                      },
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
                      buttonTapped: () {
                        updateUserText('4');
                      },
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '5',
                      buttonTapped: () {
                        updateUserText('5');
                      },
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '6',
                      buttonTapped: () {
                        updateUserText('6');
                      },
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: '-',
                      buttonTapped: () {
                        updateUserText('-');
                        uptateTempText();
                      },
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
                      buttonTapped: () {
                        updateUserText('1');
                      },
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '2',
                      buttonTapped: () {
                        updateUserText('2');
                      },
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: '3',
                      buttonTapped: () {
                        updateUserText('3');
                      },
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: '+',
                      buttonTapped: () {
                        updateUserText('+');
                        uptateTempText();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyZeroButton(
                      color: numberButtonColor,
                      buttonText: '0',
                      buttonTapped: () {
                        updateUserText('0');
                      },
                    ),
                    MyButton(
                      color: numberButtonColor,
                      buttonText: ',',
                      buttonTapped: () {
                        updateUserText('.');
                      },
                    ),
                    MyButton(
                      color: operatorButtonColor,
                      buttonText: '=',
                      buttonTapped: () {
                        uptateTempText();
                        _result = Calculate().calculate(tempText);
                        killText();
                        updateUserText(_result.toString());
                      },
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
    if (textLimitControl()) {
      setState(() {
        userText += text;
        // Prevents the first character from being an operator.
        if(userText.length == 1) {
          if(isItOperator(text)) {
            userText = '';
          }
        }
      });
    }
  }

  void uptateTempText() {
    setState(() {
      if(userText.isNotEmpty) {
        tempText += userText;
        userText = '';
      }
    });
  }

  void killText() {
    setState(() {
      userText = '';
      tempText = '';
    });
  }

  void deleteText() {
    setState(() {
      if(userText.isNotEmpty) {
        userText = userText.substring(0, userText.length - 1);
      }
    });
  }

  bool isItOperator(String text) {
    if(text != 'x' && text != '÷' && text != '+' && text != '-' && text != '%' && text != '.') {
      return false;
    }
    return true;
  }

  bool textLimitControl() {
    if (userText.length != 8) {
      return true;
    }
    return false;
  }
}
