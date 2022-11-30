import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final label;
  final onPressed;
  final onLongPress;
  final Color? backgroundColor;
  const CustomButton({
    Key? key,
    @required this.label,
    @required this.onPressed,
    this.onLongPress,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: backgroundColor ?? Colors.teal[300],
              ),
              onLongPress: onLongPress,
              onPressed: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(label),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
