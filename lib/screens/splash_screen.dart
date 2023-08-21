import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_runner_flutter/screens/homepage.dart';
import 'package:food_runner_flutter/themes/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    transitToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: orange,
    );
  }

  Future<void> transitToHomePage() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }
}
