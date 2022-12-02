import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListDoctorScreen extends StatefulWidget {
  @override
  _ListDoctorScreenState createState() => _ListDoctorScreenState();
}

class _ListDoctorScreenState extends State<ListDoctorScreen> {
  bool searchBoolean = false;
  List<QueryDocumentSnapshot> allDocs = [];
  List<QueryDocumentSnapshot> filteredDocs = [];

  Future<List<QueryDocumentSnapshot>> getDoctors() async {
    CollectionReference docsDB =
        FirebaseFirestore.instance.collection('Doctors');
    var list = await docsDB.orderBy('nome').get();
    return list.docs.toList();
  }

  void filterDoctors(String search) async {
    search = search.toLowerCase();
    setState(() {
      filteredDocs = allDocs
          .where(
            (doc) =>
                "${doc["nome"] ?? ""}".toLowerCase().contains(search) ||
                "${doc["crm"] ?? ""}".toLowerCase().contains(search) ||
                "${doc["hospital"] ?? ""}".toLowerCase().contains(search) ||
                "${doc["especialidade"] ?? ""}"
                    .toLowerCase()
                    .contains(search) ||
                "${doc["endereco"] ?? ""}".toLowerCase().contains(search) ||
                "${doc["telefone"] ?? ""}".toLowerCase().contains(search),
          )
          .toList();
    });
  }

  Widget _searchTextField() {
    return TextField(
      onChanged: (String search) {
        filterDoctors(search);
      },
      autofocus: true,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: 'Buscar...',
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF1E53BD),
          centerTitle: true,
          title: !searchBoolean
              ? const Text(
                  'Médicos',
                )
              : _searchTextField(),
          actions: !searchBoolean
              ? [
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          searchBoolean = true;
                        });
                      })
                ]
              : [
                  IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          searchBoolean = false;
                        });
                      })
                ]),
      body: searchBoolean
          ? ListView(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              physics: const BouncingScrollPhysics(),
              children: [
                ...filteredDocs.map(
                  (doc) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {},
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: const Color(0xFFF8F8F6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 8),
                                blurRadius: 8,
                                spreadRadius: -5,
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                "${doc["nome"]} - ${doc["crm"]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF1E53BD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Text(
                                "Especialidade: ${doc["especialidade"]}",
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Text(
                                "Hospital: ${doc["hospital"]}",
                                style: const TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Text(
                                "Endereço: ${doc["endereco"]}",
                                style: const TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Text(
                                "Contato: ${doc["telefone"]}",
                                style: const TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : FutureBuilder(
              future: getDoctors(),
              builder:
                  (context, AsyncSnapshot<List<QueryDocumentSnapshot>> docs) {
                if (!docs.hasData && docs.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (docs.hasData && docs.data!.isNotEmpty) {
                  allDocs = docs.data!;
                  return ListView(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...docs.data!.map(
                        (doc) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {},
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: const Color(0xFFF8F8F6),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 8),
                                      blurRadius: 8,
                                      spreadRadius: -5,
                                    ),
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "${doc["nome"]} - ${doc["crm"]}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF1E53BD),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Text(
                                      "Especialidade: ${doc["especialidade"]}",
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Text(
                                      "Hospital: ${doc["hospital"]}",
                                      style: const TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Text(
                                      "Endereço: ${doc["endereco"]}",
                                      style: const TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Text(
                                      "Contato: ${doc["telefone"]}",
                                      style: const TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Column(
                  children: const [Text("Não há dados cadastrados")],
                );
              },
            ),
    );
  }
}
