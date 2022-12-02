import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brasil_fields/brasil_fields.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  String hospital = "";
  String nome = "";
  String crm = "";
  String especialidade = "";
  String endereco = "";
  String telefone = "";

  Future<void> saveDoctor(BuildContext context) async {
    DocumentReference doctor =
        FirebaseFirestore.instance.collection('Doctors').doc(crm);

    await doctor.get().then((DocumentSnapshot doc) async {
      if (doc.exists) {
        await doctor.update({
          "crm": crm,
          "nome": nome,
          "hospital": hospital,
          "especialidade": especialidade,
          "endereco": endereco,
          "telefone": telefone,
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Cadastro realizado!")));
        Navigator.of(context).pop();
        return;
      } else {
        await doctor.set({
          "crm": crm,
          "nome": nome,
          "hospital": hospital,
          "especialidade": especialidade,
          "endereco": endereco,
          "telefone": telefone,
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Cadastro realizado!")));
        Navigator.of(context).pop();
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E53BD),
        centerTitle: true,
        title: const Text(
          'Dados do Médico',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              //   Image.asset(
              //     'assets/hospital.svg',
              //   ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/hospital.svg",
                    width: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Nome do Hospital*",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            hospital = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/doutor.svg",
                    width: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Nome*",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            nome = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/crm.svg",
                    width: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "CRM*",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            crm = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/especialidade.svg",
                    width: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Especialidade*",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            especialidade = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/endereco.svg",
                    width: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Endereço*",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            endereco = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/telefone.svg",
                    width: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Telefone*",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        onChanged: (val) {
                          setState(() {
                            telefone = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (crm.isNotEmpty &&
                      nome.isNotEmpty &&
                      hospital.isNotEmpty &&
                      especialidade.isNotEmpty &&
                      endereco.isNotEmpty &&
                      telefone.isNotEmpty) {
                    await saveDoctor(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Os campos com * são obrigatórios")));
                  }
                },
                child: const Text('Cadastrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
