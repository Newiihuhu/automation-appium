import 'package:automation_appium/dashboard/dashboard_screen.dart';
import 'package:automation_appium/setting/setting_screen.dart';
import 'package:automation_appium/widgets/bottom_navigationBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentTab = 0;
  late PageController pageController;

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
        ) // Changed to a defined method call
        );
  }

  Widget bodyView(int currentTab) {
    // var type replaced with Widget return type
    List<Widget> tabView = [];
    //Current Tabs in Home Screen...
    switch (currentTab) {
      case 0:
        //Dashboard Page
        tabView = [const DashboardScreen()];
        break;
      case 1:
        //Search Page
        tabView = [Container()];
        break;
      case 2:
        //Profile Page
        tabView = [Container()];
        break;
      case 3:
        //Setting Page
        tabView = [SettingScreen()];
        break;
    }
    return PageView(controller: pageController, children: tabView);
  }
}
