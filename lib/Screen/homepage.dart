import 'package:customeraccount/Screen/form_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FormScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/spalsh.gif",
              gaplessPlayback: true,
              fit: BoxFit.fill,
            )));
  }
}
