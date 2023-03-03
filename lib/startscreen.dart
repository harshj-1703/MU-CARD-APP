import 'package:flutter/material.dart';
import 'package:mu_card/login/loginscreen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    nevigateToMain();
    super.initState();
  }

  nevigateToMain() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        ((route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // stops: [0.5, 0.5],
        colors: [Color.fromARGB(255, 0, 255, 251), Colors.white],
      )),
      child: Image.asset(
        'assets/images/mu-logo.png',
        width: 300,
      ),
    );
  }
}
