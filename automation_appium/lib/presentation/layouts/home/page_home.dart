import 'package:automation_appium/presentation/journey/dashboard/dashboard_screen.dart';
import 'package:automation_appium/presentation/journey/profile/profile_screen.dart';
import 'package:automation_appium/presentation/journey/setting/setting_screen.dart';
import 'package:automation_appium/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentTab = 0;
  late PageController pageController;
  List<Map<String, Object>> bottomNavBarItem = [
    {
      'backgroundColor': Colors.blue,
      'icon': const Icon(Icons.home),
      'label': 'Dashboard',
    },
    {
      'backgroundColor': Colors.green,
      'icon': const Icon(Icons.account_circle),
      'label': 'Profile',
    },
    {
      'icon': const Icon(Icons.settings),
      'label': 'Setting',
    },
  ];

  void _changeCurrentTab(int tab) {
    setState(() {
      currentTab = tab;
      pageController.jumpToPage(tab);
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyView(currentTab),
        bottomNavigationBar: BottomNavBar(
          onTabSelection: _changeCurrentTab,
          items: bottomNavBarItem,
        ) // Changed to a defined method call
        );
  }

  Widget bodyView(int currentTab) {
    // var type replaced with Widget return type
    List<Widget> tabView = [];
    //Current Tabs in Home Screen...
    switch (currentTab) {
      case 0:
        tabView = [const DashboardScreen()];
        break;
      case 1:
        tabView = [const ProfileScreen()];
        break;
      case 2:
        tabView = [const SettingScreen()];
        break;
    }
    return PageView(controller: pageController, children: tabView);
  }
}
