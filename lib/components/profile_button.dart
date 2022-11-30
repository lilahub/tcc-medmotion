import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final text;
  final padding;
  final icon;
  const ProfileButton({Key? key, this.padding, this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Divider(
              height: 12,
              thickness: 1,
              color: Color(0xFF1E53BD).withOpacity(0.2),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      icon,
                      color: Color(0xFF1E53BD),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            color: Color(0xFF1E53BD),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        /*Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF1E53BD),
                        ),*/
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFF1E53BD).withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
