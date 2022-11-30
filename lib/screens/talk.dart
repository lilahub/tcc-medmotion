import 'package:flutter/material.dart';

class Talk extends StatelessWidget {
  const Talk({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E53BD),
        title: Center(child: Text('Conversar')),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //    PrescripButton(),
          //  ],
        ),
      ),
    );
  }
}
