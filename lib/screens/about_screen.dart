import 'package:flutter/material.dart';
//import 'package:medmotion/screens/login_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF1E53BD),
        title: const Text('Sobre Nós'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "A comunicação dos surdos ainda é um desafio e tem muitas barreiras. Uma delas é receber atendimento hospitalar eficiente, provocando marginalização por acesso à informação precário. Isso evidencia a falta de conhecimento da Língua Brasileira de Sinais (LIBRAS) por parte dos funcionários da área da saúde, além do despreparo para assistir pacientes surdos."
              "\n\nO objetivo do Medmotion é atuar como uma alternativa prática e acessível para unidades de atendimento de saúde, ajudando profissionais a recepcionar pessoas surdas, ainda que não saibam a língua brasileira de sinais. "
              "\n\nO aplicativo foi desenvolvido por Lara Fernandes Santos Ferreira, aluna do curso de Ciência da Computação do IFMA Campus Caxias, sob orientação do Prof. Dr. Luis Fernando Maia Santos Silva como produto do trabalho de conclusão de curso intitulado: MEDMOTION: Aplicativo para a comunicação entre profissionais da saúde e surdos que se comunicam através da Libras.",
              style: TextStyle(
                color: Color(0xFF1E53BD),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
