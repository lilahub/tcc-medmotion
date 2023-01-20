import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medmotion/components/custom_button.dart';
import 'package:medmotion/components/prescrip_button.dart';
//import 'package:medmotion/screens/login_screen.dart';
import 'package:medmotion/screens/newprescrip.dart';

class Receitas extends StatelessWidget {
  const Receitas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E53BD),
        title: const Center(child: Text('Prescrições')),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: Hive.box("receitas").listenable(),
                  builder: (context, box, _) {
                    return ListView(
                      children: [
                        ...Hive.box("receitas").values.map(
                              (e) => CustomButton(
                                label: e["name"],
                                onPressed: () {
                                  File file = File(e["pdf"]);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ViewPdf(
                                        file: file,
                                        path: e["pdf"],
                                      ),
                                    ),
                                  );
                                },
                                onLongPress: () async {
                                  var result = await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text(
                                                "Deseja remover essa prescrição?"),                                                                   
                                           
                                            actions: [
                                              PrescripButton(
                                                  text: "Ok",                                                
                                                  widthButton:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.2,
                                                  
                                                  nextScreen: () {
                                                    Navigator.of(context)
                                                        .pop(true);
                                                  }
                                                  ),
                                                  TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                      
                                                },
                                                child: const Text("Cancelar"),
                                                
                                              
                                                
                                              ),
                                            ],
                                        
                                      


                                          ));

                                  if (result ?? false) {
                                    Hive.box("receitas").delete(e["id"]);
                                  }
                                },
                              ),
                            )
                      ],
                    );
                  }),
            ),
            PrescripButton(
              text: "Escrever nova prescrição",
              widthButton: MediaQuery.of(context).size.width * 0.7,
              
              nextScreen: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => NewPrescription())),
            ),
          ],
        ),
      ),
    );
  }
}
