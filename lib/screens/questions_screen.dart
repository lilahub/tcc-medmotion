import 'package:flutter/material.dart';
import 'package:medmotion/components/custom_button.dart';
import 'package:medmotion/components/videoplayer.dart';

class Perguntas extends StatelessWidget {
  const Perguntas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Clique nas frases para assistir os vídeos em Libras",
                    style: TextStyle(
                      color: Color(0xFF1E53BD),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text(
                "Sintomas",
                style: TextStyle(
                  color: Color(0xFF1E53BD),
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomButton(
                label: "Onde você sente dor?",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                            videoPath: 'assets/onde-vc-sente-dor.mp4',
                          )));
                },
              ),
              CustomButton(
                label: "Teve febre? Quando?",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                            videoPath: 'assets/teve-febre-quando.mp4',
                          )));
                },
              ),
              CustomButton(
                label: "Quais outros sintomas você teve?",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                            videoPath: 'assets/outros-sintomas.mp4',
                          )));
                },
              ),
              CustomButton(
                label: "Você teve mal estar e/ou fraqueza?",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                            videoPath: 'assets/teve-mal-estar-fraqueza.mp4',
                          )));
                },
              ),
              CustomButton(
                label: "Você já foi no médico?",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                            videoPath: 'assets/medico-foi-ja.mp4',
                          )));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Medicamentos",
                  style: TextStyle(
                    color: Color(0xFF1E53BD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomButton(
                label: "Você tomou algum remédio?",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                            videoPath: 'assets/tomou-remedio.mp4',
                          )));
                },
              ),
              CustomButton(
                label: "Quais os nomes dos remédios?",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                            videoPath: 'assets/quais-remedios-tomou.mp4',
                          )));
                },
              ),
              CustomButton(
                label: "Esse remédio funcionou?",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                            videoPath: 'assets/remedio-funcionou.mp4',
                          )));
                },
              ),
              CustomButton(
                label: "Você tem alergia a algum remédio?",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                            videoPath: 'assets/alergia-remedio.mp4',
                          )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
