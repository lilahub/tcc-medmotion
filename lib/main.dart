import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medmotion/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseOptions firebaseOptions = const FirebaseOptions(
      apiKey: "AIzaSyBXMjUyB2phOsSN7hz0eFUwdmsAF01NVDg",
      authDomain: "medmotion-49cf0.firebaseapp.com",
      projectId: "medmotion-49cf0",
      storageBucket: "medmotion-49cf0.appspot.com",
      messagingSenderId: "408189579178",
      appId: "1:408189579178:android:7fa42db1087274efafc5d3");

  await Firebase.initializeApp(options: firebaseOptions);

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
        fontFamily: 'Poppins-Regular', //GoogleFonts.poppins().fontFamily,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal[300],
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blue),
      ),
      home: HomeScreen(),
    );
  }
}
