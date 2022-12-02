import 'package:flutter/material.dart';
import 'package:medmotion/screens/profile_screen.dart';
import 'package:medmotion/screens/questions_screen.dart';
import 'package:medmotion/screens/prescription_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widget> telas = [
    const Perguntas(),
    const Receitas(),
    ProfileScreen(),
  ];

  setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: setIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.teal,
        unselectedItemColor: const Color(0xFF1E53BD),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Perguntas",
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Prescrições",
            //   backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Informações",
            //   backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class NewPageScreen extends StatelessWidget {
  final String texto;

  const NewPageScreen(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(texto),
      ),
    );
  }
}
