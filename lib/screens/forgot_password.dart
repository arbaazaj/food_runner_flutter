import 'package:flutter/material.dart';
import 'package:food_runner_flutter/themes/colors.dart';
import 'package:food_runner_flutter/widgets/custom_button_widget.dart';
import 'package:food_runner_flutter/widgets/custom_text_field_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
          'Reset Your Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: orange,
      ),
      body: Column(
        children: [
          // Add App Logo
          const SizedBox(height: 150),
          const Text(
            'Enter your registered mobile number and email below',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20),
          const CustomTextField(
            keyboardInputType: TextInputType.phone,
            hintText: 'Mobile Number (10 digits)',
            iconData: Icons.phone_android,
          ),
          const SizedBox(height: 10.0),
          const CustomTextField(
            keyboardInputType: TextInputType.emailAddress,
            hintText: 'Email Address',
            iconData: Icons.email,
          ),
          const SizedBox(height: 10.0),
          CustomButton(
            buttonText: 'Next',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
