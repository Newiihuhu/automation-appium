import 'package:automation_appium/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:automation_appium/utils/firebase.dart'; // Assuming this is your Firebase utility file

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontFamily: 'Exo2',
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorCurve,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _currentPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Current Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Existing code for the new password field
              TextFormField(
                controller: _newPasswordController,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  } else if (value == _currentPasswordController.text) {
                    return 'New password should be different from the current password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmNewPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your new password';
                  } else if (value != _newPasswordController.text) {
                    return 'Confirm new password does not match the new password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
// Existing code for the ElevatedButton
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool reauthSuccess = await reauthenticateUser(
                      FirebaseAuth.instance.currentUser!.email!,
                      _currentPasswordController.text,
                      (String errorMsg) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMsg)),
                        );
                      },
                    );
                    if (reauthSuccess) {
                      await FirebaseAuth.instance.currentUser!.updatePassword(
                        _newPasswordController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Password changed successfully')),
                      );
                    }
                  }
                },
                child: const Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
