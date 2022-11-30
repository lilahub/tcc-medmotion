import 'package:flutter/material.dart';
import 'package:medmotion/components/custom_button.dart';
import 'package:medmotion/screens/about_screen.dart';
import 'package:medmotion/screens/doctor_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: padding, right: padding),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
              child: Image.asset(
                "assets/logo1.png",
                fit: BoxFit.contain,
              ),
            ),
            CustomButton(
              label: "Sobre nós",
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const AboutScreen())),
            ),
            CustomButton(
              label: "Você é médico? Participe!",
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => DoctorScreen())),
            ),
            CustomButton(
              backgroundColor: const Color(0xFF1E53BD),
              label: "Lista de médicos parceiros",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
