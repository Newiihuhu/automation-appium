import 'package:automation_appium/dashboard/dashboard_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../signup/signup_screen.dart';
import '../widgets/gradient_text.dart';
import '../widgets/input_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _loginGradientText(),
                const SizedBox(height: 10),
                _textAccount(),
                const SizedBox(height: 50),
                _loginFields(),
                const SizedBox(height: 20),
                _loginButtonWidget(),
                const SizedBox(height: 20),
                _loginWithSocialButtons()
              ],
            ),
          ),
        ));
  }

  Widget _loginWithSocialButtons() {
    return Column(
      children: [
        const Text(
          "Or Login with",
          style:
              TextStyle(fontFamily: 'Exo2', fontSize: 16.0, color: Colors.grey),
        ),
        const SizedBox(height: 12),
        _socialButtons()
      ],
    );
  }

  GradientText _loginGradientText() {
    return const GradientText(
      'Login',
      gradient: LinearGradient(colors: [
        Color.fromRGBO(97, 6, 165, 1.0),
        Color.fromRGBO(45, 160, 240, 1.0)
      ]),
      style: TextStyle(
          fontFamily: 'Exo2', fontSize: 36, fontWeight: FontWeight.bold),
    );
  }

  RichText _textAccount() {
    return RichText(
      text: TextSpan(
          text: "Don't have an account? ",
          children: [
            TextSpan(
              style: const TextStyle(color: Colors.deepOrange),
              text: 'Create your account.',
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen())),
            )
          ],
          style: const TextStyle(
              color: Colors.black87, fontSize: 16, fontFamily: 'Exo2')),
    );
  }

  InputText _emailWidget() {
    return InputText(
        controller: _emailController,
        focusNode: _emailFocusNode,
        hintText: "Enter email",
        obscureText: false,
        onSaved: (String? val) {},
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_passFocusNode);
        },
        icon: Icons.email,
        iconColor: const Color.fromRGBO(97, 10, 165, 0.8));
  }

  InputText _passwordWidget() {
    return InputText(
      controller: _passwordController,
      focusNode: _passFocusNode,
      hintText: "Enter Password",
      obscureText: true,
      icon: Icons.lock_outline,
      onSaved: (String? val) {},
      iconColor: const Color.fromRGBO(97, 10, 165, 0.8),
      onFieldSubmitted: (String value) {},
    );
  }

  Center _loginButtonWidget() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              padding: const EdgeInsets.all(12),
              backgroundColor: const Color.fromRGBO(97, 10, 165, 0.8)),
          child: const Text(
            "LOGIN",
            style: TextStyle(
                fontFamily: 'Exo2',
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            // Going to DashBoard
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ),
            );
          },
        ),
      ),
    );
  }

  Row _socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        socialCircleAvatar("assets/icnfb.png", () {}),
        const SizedBox(width: 18),
        socialCircleAvatar("assets/icn_twitter.png", () {}),
        const SizedBox(width: 18),
        socialCircleAvatar("assets/icngmail.png", () {}),
      ],
    );
  }

  GestureDetector socialCircleAvatar(String assetIcon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: 24,
        backgroundColor: Colors.transparent,
        child: Image.asset(assetIcon),
      ),
    );
  }

  _loginFields() => Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              _emailWidget(),
              const SizedBox(height: 20),
              _passwordWidget(),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password?",
                            style:
                                TextStyle(fontFamily: 'Exo2', fontSize: 16.0))),
                  )),
            ],
          ),
        ),
      );
}
