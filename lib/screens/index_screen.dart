import 'package:flutter/material.dart';
import 'package:medmotion/components/primary_button.dart';
import 'package:medmotion/screens/login_screen.dart';
import 'sign_up_screen.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                "assets/logo1.png",
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            PrimaryButton(
              text: "Login",
              widthButton: MediaQuery.of(context).size.width * 0.7,
              nextScreen: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LoginScreen())),
            ),
            Text("Primeira vez por aqui?"),
            PrimaryButton(
              text: "Criar conta",
              widthButton: MediaQuery.of(context).size.width * 0.7,
              nextScreen: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CadastroScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
