import 'package:automation_appium/login/login_screen.dart';
import 'package:automation_appium/utils/firebase.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/gradient_text.dart';
import '../widgets/input_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();
  final FocusNode _confirmPassFocusNode = FocusNode();
  late String _name, _email, _password, _confirmPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(97, 10, 165, 0.8),
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
                const SizedBox(width: 10),
                _loginGradientText(),
              ],
            ),
            const SizedBox(height: 10),
            _textAccount(),
            const SizedBox(height: 50),
            registerFields()
          ],
        ),
      )),
    );
  }

  GradientText _loginGradientText() {
    return const GradientText(
      'Register',
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
          text: "Have you registered already? ",
          children: [
            TextSpan(
              style: const TextStyle(color: Colors.deepOrange),
              text: 'Login here',
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pop(context),
            )
          ],
          style: const TextStyle(
              fontFamily: 'Exo2', color: Colors.black87, fontSize: 16)),
    );
  }

  InputText _nameWidget() {
    return InputText(
        controller: _nameController,
        focusNode: _nameFocusNode,
        hintText: "Enter Name",
        obscureText: false,
        onSaved: (String? val) {
          _name = val!;
        },
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        icon: Icons.person,
        iconColor: const Color.fromRGBO(97, 10, 165, 0.8));
  }

  InputText _emailWidget() {
    return InputText(
        controller: _emailController,
        focusNode: _emailFocusNode,
        hintText: "Enter email",
        obscureText: false,
        onSaved: (String? val) {
          _email = val!;
        },
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
      onSaved: (String? val) {
        _password = val!;
      },
      iconColor: const Color.fromRGBO(97, 10, 165, 0.8),
      onFieldSubmitted: (String value) {},
    );
  }

  InputText _confirmPasswordWidget() {
    return InputText(
      controller: _confirmPasswordController,
      focusNode: _confirmPassFocusNode,
      hintText: "Enter Confirm Password",
      obscureText: true,
      icon: Icons.lock_outline,
      validator: (val) {
        if (val!.isEmpty) return 'Confirm password is required';
        if (val != _passwordController.text) return 'Passwords do not match';
        return null;
      },
      onSaved: (String? val) {
        _confirmPassword = val!;
      },
      iconColor: const Color.fromRGBO(97, 10, 165, 0.8),
      onFieldSubmitted: (String value) {},
    );
  }

  Container _signUpButtonWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          padding: const EdgeInsets.all(12),
          backgroundColor: const Color.fromRGBO(97, 10, 165, 0.8),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            bool success =
                await signUpUser(_email, _password, _name, (String errorMsg) {
              // Handle error by showing an alert dialog or a snackbar
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(errorMsg)));
            });
            if (success) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Sign up successful! Please log in."),
                duration: Duration(seconds: 3),
              ));
              // Navigate to LoginScreen after a delay
              await Future.delayed(const Duration(milliseconds: 300));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }
          }
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
              fontFamily: 'Exo2',
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  registerFields() => Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _nameWidget(),
          const SizedBox(height: 10),
          _emailWidget(),
          const SizedBox(height: 10),
          _passwordWidget(),
          const SizedBox(height: 10),
          _confirmPasswordWidget(),
          const SizedBox(height: 20),
          _signUpButtonWidget(),
        ],
      ));
}
