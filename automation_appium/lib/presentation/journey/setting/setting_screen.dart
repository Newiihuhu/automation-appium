import 'package:automation_appium/presentation/journey/change-password/change_password_screen.dart';
import 'package:automation_appium/presentation/journey/login/login_screen.dart';
import 'package:automation_appium/utils/colors.dart';
import 'package:automation_appium/utils/preferences.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingScreen> {
  bool isPrivateAccount = false;
  bool pushNotification = true;
  bool localNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Exo2',
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorCurve,
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('ACCOUNT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          // ListTile(
          //   title: const Text('User Name'),
          //   subtitle: const Text('miwtoo'),
          //   trailing: const Icon(Icons.navigate_next),
          //   onTap: () {},
          // ),
          // ListTile(
          //   title: const Text('Private Account'),
          //   trailing: Switch(
          //     value: isPrivateAccount,
          //     onChanged: (bool value) {
          //       setState(() {
          //         isPrivateAccount = value;
          //       });
          //     },
          //   ),
          // ),
          ListTile(
            title: const Text('Change Password'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () async {
              await Preferences.setLoggedIn('');
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
              );
            },
          ),
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text('PUSH NOTIFICATIONS',
          //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          // ),
          // ListTile(
          //   title: const Text('Push Notification'),
          //   trailing: Switch(
          //     value: pushNotification,
          //     onChanged: (bool value) {
          //       setState(() {
          //         pushNotification = value;
          //       });
          //     },
          //   ),
          // ),
          // ListTile(
          //   title: const Text('Local Notification'),
          //   trailing: Switch(
          //     value: localNotification,
          //     onChanged: (bool value) {
          //       setState(() {
          //         localNotification = value;
          //       });
          //     },
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text('GET HELP',
          //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          // ),
          // ListTile(
          //   title: const Text('Contact Us'),
          //   trailing: const Icon(Icons.navigate_next),
          //   onTap: () {},
          // ),
          // ListTile(
          //   title: const Text('Terms and Condition'),
          //   trailing: const Icon(Icons.navigate_next),
          //   onTap: () {},
          // ),
          // ListTile(
          //   title: const Text('Feedback'),
          //   trailing: const Icon(Icons.navigate_next),
          //   onTap: () {},
          // ),
          ListTile(
            title: const Text(
              'Log out',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: () async {
              await Preferences.setLoggedIn('');
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
