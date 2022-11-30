import 'package:flutter/material.dart';
import 'package:medmotion/components/custom_textfield.dart';
import 'package:medmotion/components/primary_button.dart';

class CadastroScreen extends StatelessWidget {
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
                padding: const EdgeInsets.only(bottom: 35),
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
              CustomTextField(
                label: "Confirma senha",
              ),
              PrimaryButton(
                text: "Criar conta",
                nextScreen: () {},
                widthButton: sizeWidth(70),
              )
            ],
          ),
        ),
      ),
    );
  }
}
