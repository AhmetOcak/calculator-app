import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, required this.tempText, required this.userText})
      : super(key: key);

  String tempText = '';
  String userText = '';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Text(
                      tempText,
                      style: const TextStyle(
                          fontSize: 45,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      userText,
                      style: const TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
