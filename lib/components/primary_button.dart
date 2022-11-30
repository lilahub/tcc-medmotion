import 'dart:ui';

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final text;
  final widthButton;
  final void Function()? nextScreen;
  PrimaryButton({this.text, this.widthButton = 100.0, this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF1E53BD),
            primary: Colors.white,
          ),
          onPressed: nextScreen,
          child: Container(
            alignment: Alignment.center,
            width: widthButton,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
