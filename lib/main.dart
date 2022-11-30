import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medmotion/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  await Hive.openBox("receitas");
  runApp(MedmotionApp());
}

class MedmotionApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return MaterialApp(
      title: 'Medmotion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blue,
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins-Regular', //GoogleFonts.poppins().fontFamily,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal[300],
            primary: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
