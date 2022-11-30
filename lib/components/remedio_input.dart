import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RemedioInput extends StatefulWidget {
  Map remedio;
  RemedioInput({required this.remedio, Key? key}) : super(key: key);

  @override
  _RemedioInputState createState() => _RemedioInputState();
}

class _RemedioInputState extends State<RemedioInput> {
  var name = "";
  var type = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/remedio.svg",
                width: 35,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isCollapsed: true,
                      hintText: "Remédio e mg*",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          name.isNotEmpty
              ? Wrap(
                  children: [
                    ...[
                      {
                        "name": "Tópico",
                        "icon": "assets/pomada.svg",
                      },
                      {
                        "name": "Oral",
                        "icon": "assets/boca.svg",
                      },
                      {"name": "Injetável", "icon": "assets/injecao.svg"},
                    ].map((e) => Row(
                          children: [
                            SvgPicture.asset(
                              e["icon"] ?? "",
                              width: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Radio(
                                value: e["name"],
                                groupValue: type,
                                onChanged: (value) {
                                  setState(() {
                                    type = value??"";
                                    widget.remedio.addAll({
                                      "nome": name,
                                      "metodo": type,
                                      "icon": e["icon"],
                                    });
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            Text(e["name"]??""),
                          ],
                        ))
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
