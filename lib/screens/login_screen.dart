import 'package:flutter/material.dart';
import 'package:medmotion/components/custom_textfield.dart';
import 'package:medmotion/components/primary_button.dart';
import 'package:medmotion/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeWidth(double proporcao) {
      return MediaQuery.of(context).size.width * (proporcao / 100);
    }

    double sizeHeight(double proporcao) {
      return MediaQuery.of(context).size.height * (proporcao / 100);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sizeHeight(100),
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
              CustomTextField(
                label: "Digite seu email",
              ),
              CustomTextField(
                label: "Senha",
              ),
              Container(
                alignment: Alignment.centerRight,
                width: sizeWidth(70),
                child: Text(
                  "Esqueci minha senha",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              PrimaryButton(
                text: "Entrar",
                nextScreen: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomeScreen())),
                widthButton: sizeWidth(70),
              )
            ],
          ),
        ),
      ),
    );
  }
}
