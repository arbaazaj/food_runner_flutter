import 'package:flutter/material.dart';
import 'package:food_runner_flutter/themes/colors.dart';
import 'package:food_runner_flutter/widgets/custom_button_widget.dart';
import 'package:food_runner_flutter/widgets/custom_text_field_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Register Yourself',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: orange,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          const CustomTextField(
            keyboardInputType: TextInputType.name,
            hintText: 'Enter Your Name (Min 3 Character)',
            iconData: Icons.person,
          ),
          const SizedBox(height: 5.0),
          const CustomTextField(
            keyboardInputType: TextInputType.emailAddress,
            hintText: 'E-mail Address',
            iconData: Icons.email_outlined,
          ),
          const SizedBox(height: 5.0),
          const CustomTextField(
            keyboardInputType: TextInputType.phone,
            hintText: 'Mobile Number (10 digits)',
            iconData: Icons.phone_android,
          ),
          const SizedBox(height: 5.0),
          const CustomTextField(
            keyboardInputType: TextInputType.streetAddress,
            hintText: 'Delivery Address',
            iconData: Icons.location_on,
          ),
          const SizedBox(height: 5.0),
          const CustomTextField(
            obscureText: true,
            keyboardInputType: TextInputType.visiblePassword,
            hintText: 'Choose a password (Min 4 char)',
            iconData: Icons.lock,
          ),
          const SizedBox(height: 5.0),
          const CustomTextField(
            obscureText: true,
            keyboardInputType: TextInputType.visiblePassword,
            hintText: 'Confirm Password',
            iconData: Icons.lock,
          ),
          CustomButton(
            buttonText: 'Register',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
