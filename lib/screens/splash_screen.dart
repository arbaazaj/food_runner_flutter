import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_runner_flutter/screens/login_screen.dart';
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
      body: Center(
        child: Text(
          'FoodRunner',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  Future<void> transitToHomePage() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }
}
