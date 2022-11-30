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
              "sdfsdfsdfsdfdsfdsf dsf sdf sd fsdfdsfdf df df  s sdfsdf dfgdfg dfg ddfg dfg dfg gd gd d g sfdgdfg dfgdfgdfgdifgjsifdgjdfogjd dfigj doifgjodif sdfsdfsdfsdfdsfdsf dsf sdf sd fsdfdsfdf df df  s sdfsdf dfgdfg dfg ddfg dfg dfg gd gd d g sfdgdfg dfgdfgdfgdifgjsifdgjdfogjd dfigj doifgjodif sdfsdfsdfsdfdsfdsf dsf sdf sd fsdfdsfdf df df  s sdfsdf dfgdfg dfg ddfg dfg dfg gd gd d g sfdgdfg dfgdfgdfgdifgjsifdgjdfogjd dfigj doifgjodif sdfsdfsdfsdfdsfdsf dsf sdf sd fsdfdsfdf df df  s sdfsdf dfgdfg dfg ddfg dfg dfg gd gd d g sfdgdfg dfgdfgdfgdifgjsifdgjdfogjd dfigj doifgjodif ",
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
