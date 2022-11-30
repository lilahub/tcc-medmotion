import 'package:flutter/material.dart';

class CheckboxDay extends StatefulWidget {
  Map day;
  CheckboxDay({required this.day, Key? key}) : super(key: key);

  @override
  _CheckboxDayState createState() => _CheckboxDayState();
}

class _CheckboxDayState extends State<CheckboxDay> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
            value: widget.day["isSelected"],
            onChanged: (value) {
              setState(() {
                widget.day["isSelected"] = value;
              });
            }),
        Text(
          widget.day["label"],
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
