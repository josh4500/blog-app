import 'package:blog_app/ui/widget/authentication/authentication_button.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'create account',
            style: TextStyle(color: Colors.grey),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'email',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  child: Text(
                    obscurePassword ? 'Show' : 'Hide',
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          AunthenticationButton(
            text: 'SIGN UP',
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Login here',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          Expanded(
              child: Column(
            children: [
              const Text('OR SIGN UP WITH'),
              const SizedBox(height: 10.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButton.mini(
                      buttonType: ButtonType.google,
                      onPressed: () {},
                    ),
                    SignInButton.mini(
                      buttonType: ButtonType.facebook,
                      onPressed: () {},
                    ),
                    SignInButton.mini(
                      buttonType: ButtonType.twitter,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
