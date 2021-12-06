import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const MyApp(),
        ),
      ),
    );
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, 1),
              end: Alignment(-1, 0),
              colors: [
                Color.fromRGBO(120, 40, 103, 1),
                Color.fromRGBO(91, 43, 119, 1),
                Color.fromRGBO(46, 48, 145, 1),
                Color.fromRGBO(39, 51, 147, 1)
              ]),
        ),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.fitWidth),
            ),
          ),
        ));
    ;
  }
}
