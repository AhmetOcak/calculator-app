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
  String _userText = '';
  String _tempText = '';
  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ResultScreen(tempText: _tempText, userText: _userText),
          buttonScreen(context),
        ],
      ),
    );
  }

  void updateUserText(String text) {
    if (textLimitControl(text)) {
      setState(() {
        _userText += text;
        // Prevents the first character from being an operator.
        if (_userText.length == 1) {
          if (isItOperator(text)) {
            _userText = '';
          }
        }
      });
    }
  }

  void uptateTempText() {
    setState(() {
      if (_userText.isNotEmpty) {
        _tempText += _userText;
        _userText = '';
      }
    });
  }

  void killText() {
    setState(() {
      _userText = '';
      _tempText = '';
    });
  }

  void deleteText() {
    setState(() {
      if (_userText.isNotEmpty) {
        _userText = _userText.substring(0, _userText.length - 1);
      }
    });
  }

  bool isItOperator(String text) {
    if (text != 'x' &&
        text != '÷' &&
        text != '+' &&
        text != '-' &&
        text != '%' &&
        text != '.') {
      return false;
    }
    return true;
  }

  bool textLimitControl(String text) {
    if (_userText.length == 8 && isItOperator(text)) {
      return true;
    } else if (_userText.length != 8) {
      return true;
    }
    return false;
  }
  
  // It prevents possible errors caused by the equal sign.
  bool operatorControl(String text) {
    String plus = '+';
    String minus = '-';
    String multpily = '÷';
    String divide = 'x';
    String percent = '%';

    if(plus.allMatches(text).isNotEmpty || minus.allMatches(text).isNotEmpty || multpily.allMatches(text).isNotEmpty ||  divide.allMatches(text).isNotEmpty || percent.allMatches(text).isNotEmpty) {
      return true;
    }
    return false;
  }

  // It prevents possible errors caused by the equal sign.
  bool equalControl() {
    if(_userText.isNotEmpty && '='.allMatches(_userText).length < 2 && operatorControl(_tempText)) {
      return true;
    }
    else {
      return false;
    }
  }

  Expanded buttonScreen(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                buttonText: 'C',
                buttonTapped: () {
                  killText();
                },
              ),
              MyButton(
                buttonText: 'DEL',
                buttonTapped: () {
                  deleteText();
                },
              ),
              MyButton(
                buttonText: '%',
                buttonTapped: () {
                  updateUserText('%');
                  uptateTempText();
                },
              ),
              MyButton(
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
                buttonText: '7',
                buttonTapped: () {
                  updateUserText('7');
                },
              ),
              MyButton(
                buttonText: '8',
                buttonTapped: () {
                  updateUserText('8');
                },
              ),
              MyButton(
                buttonText: '9',
                buttonTapped: () {
                  updateUserText('9');
                },
              ),
              MyButton(
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
                buttonText: '4',
                buttonTapped: () {
                  updateUserText('4');
                },
              ),
              MyButton(
                buttonText: '5',
                buttonTapped: () {
                  updateUserText('5');
                },
              ),
              MyButton(
                buttonText: '6',
                buttonTapped: () {
                  updateUserText('6');
                },
              ),
              MyButton(
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
                buttonText: '1',
                buttonTapped: () {
                  updateUserText('1');
                },
              ),
              MyButton(
                buttonText: '2',
                buttonTapped: () {
                  updateUserText('2');
                },
              ),
              MyButton(
                buttonText: '3',
                buttonTapped: () {
                  updateUserText('3');
                },
              ),
              MyButton(
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
                buttonText: ',',
                buttonTapped: () {
                  updateUserText('.');
                },
              ),
              MyButton(
                buttonText: '=',
                buttonTapped: () {
                  if(equalControl()) {
                    uptateTempText();
                    _result = Calculate().calculate(_tempText);
                    killText();
                    updateUserText(_result.toStringAsFixed(1));
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
        ],
      ),
    );
  }
}
