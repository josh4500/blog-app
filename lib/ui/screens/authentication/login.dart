import 'package:blog_app/ui/widget/authentication/authentication_button.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            'Welcome back',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'sign in with your account',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
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
          // const SizedBox(
          //   height: 10.0,
          // ),
          AunthenticationButton(
            text: 'LOGIN',
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Forgot your password?'),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Reset here',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              children: [
                const Text('OR SIGN IN WITH'),
                const SizedBox(height: 20.0),
                Row(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
