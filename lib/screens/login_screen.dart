import 'package:flutter/material.dart';
import 'package:food_runner_flutter/screens/forgot_password.dart';
import 'package:food_runner_flutter/screens/register_screen.dart';
import 'package:food_runner_flutter/themes/colors.dart';
import 'package:food_runner_flutter/widgets/custom_button_widget.dart';
import 'package:food_runner_flutter/widgets/custom_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 220),
              const CustomTextField(
                keyboardInputType: TextInputType.phone,
                iconData: Icons.phone_android,
                hintText: 'Mobile Number (10 digits)',
              ),
              const SizedBox(height: 12.0),
              const CustomTextField(
                obscureText: true,
                keyboardInputType: TextInputType.visiblePassword,
                hintText: 'Password',
                iconData: Icons.lock,
              ),
              CustomButton(
                buttonText: 'Login',
                onPressed: () {},
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
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
          Positioned.fill(
            bottom: 15,
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text(
                  'Don\'t have an account? Sign up now',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
