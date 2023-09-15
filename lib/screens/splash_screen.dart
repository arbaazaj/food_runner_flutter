import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_runner_flutter/screens/login_screen.dart';
import 'package:food_runner_flutter/themes/colors.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    transitToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlayAnimationBuilder<double>(
              tween: Tween(begin: -400.0, end: 350.0),
              duration: const Duration(milliseconds: 2800),
              curve: Curves.easeInOutSine,
              builder: (ctx, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: child,
                );
              },
              child: Image.asset(
                'assets/food_runner_logo.png',
                fit: BoxFit.contain,
                width: 250.0,
                height: 250.0,
                errorBuilder: (ctx, obj, stx) => const Text(
                  'FoodRunner',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            // Image.asset(
            //   'assets/food_runner_logo.png',
            //   fit: BoxFit.contain,
            //   width: 250.0,
            //   height: 250.0,
            //   errorBuilder: (ctx, obj, stx) => const Text(
            //     'FoodRunner',
            //     style: TextStyle(
            //         fontSize: 32.0,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.white),
            //   ),
            // ),
            // const Text(
            //   'FoodRunner',
            //   style: TextStyle(
            //       fontSize: 32.0,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.white),
            // ),
          ],
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
