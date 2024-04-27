import 'package:automation_appium/utils/colors.dart';
import 'package:automation_appium/utils/responsive_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabSelection;
  final List<Map<String, dynamic>> items;

  const BottomNavBar({
    super.key,
    required this.onTabSelection,
    required this.items,
  });

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _currentTabIndex = 0;

  late final Screen _screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = Screen(MediaQuery.of(context).size);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: _screenSize.getWidthPx(24),
      currentIndex: _currentTabIndex,
      unselectedItemColor: Colors.black45,
      selectedItemColor: colorCurve,
      elevation: 10.0,
      selectedFontSize: 15.0,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
      items: widget.items.map((item) {
        return BottomNavigationBarItem(
          backgroundColor: item['backgroundColor'] ?? Colors.grey.shade50,
          icon: item['icon'],
          label: item['label'],
        );
      }).toList(),
    );
  }

  void _onItemTapped(int index) {
    if (index != 4) {
      setState(() {
        _currentTabIndex = index;
        widget.onTabSelection(index);
      });
    }
  }
}
