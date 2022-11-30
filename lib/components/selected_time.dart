import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectedTime extends StatefulWidget {
  List<String> hours = [];
  SelectedTime({required this.hours, Key? key}) : super(key: key);

  @override
  _SelectedTimeState createState() => _SelectedTimeState();
}

class _SelectedTimeState extends State<SelectedTime> {
  String? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/clock.svg",
              width: 35,
            ),
            Text(
              "   Selecione o(s) horário(s):",
              style: TextStyle(),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTime = null;
                });
              },
              child: Icon(
                Icons.add_circle_outline_rounded,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ...widget.hours.map(
          (time) => Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        selectedTime == null
            ? GestureDetector(
                onTap: selectedTime == null
                    ? () async {
                        var time = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (time != null)
                          setState(() {
                            selectedTime =
                                "${time.hour < 10 ? "0${time.hour}" : time.hour}:${time.minute < 10 ? "0${time.minute}" : time.minute}";
                            widget.hours.add(selectedTime!);
                          });
                      }
                    : null,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Text(
                    selectedTime ?? "Horário*",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
