import 'package:flutter/material.dart';

class DialPadButton extends StatelessWidget {
  final String number;
  final String? letters;
  final Function onPressed;
  final Widget? icon;

  DialPadButton(
      {required this.number, this.letters, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed(number),
      color: Colors.grey[200],
      shape: CircleBorder(),
      child: Container(
        width: 64,
        height: 64,
        child: Center(
          child: icon != null
              ? icon
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      letters ?? '',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
