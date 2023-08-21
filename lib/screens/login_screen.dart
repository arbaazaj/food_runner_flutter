import 'package:flutter/material.dart';
import 'package:food_runner_flutter/screens/register_screen.dart';
import 'package:food_runner_flutter/themes/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
      body: Column(
        children: [
          const SizedBox(height: 220),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                hintText: 'Mobile Number (10 digits)',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(2),
                      shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
                      backgroundColor: MaterialStatePropertyAll(buttonColorRed),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          // Add link to create account page.
        ],
      ),
    );
  }
}
