import 'package:flutter/material.dart';
import 'package:medmotion/components/custom_textfield.dart';
import 'package:medmotion/components/primary_button.dart';
import 'package:medmotion/screens/login_screen.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _nextLoginScreen() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // retorna um objeto do tipo Dialog
          return Dialog(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Email enviado com sucesso!",
                    style: TextStyle(
                      color: Color(0xFF1E53BD),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  PrimaryButton(
                    text: "Fazer login",
                    nextScreen: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoginScreen())),
                    widthButton: MediaQuery.of(context).size.width * 0.6,
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                "assets/logo1.png",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Um email será enviado com uma nova senha padrão!",
              style: TextStyle(
                color: Color(0xFF1E53BD),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            CustomTextField(
              label: "Digite o email cadastrado",
            ),
            PrimaryButton(
              text: "Enviar",
              widthButton: MediaQuery.of(context).size.width * 0.7,
              nextScreen: _nextLoginScreen,
            ),
          ],
        ),
      ),
    );
  }
}
