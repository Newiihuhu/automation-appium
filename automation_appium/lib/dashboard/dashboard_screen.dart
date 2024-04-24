import 'package:automation_appium/models/Property.dart';
import 'package:automation_appium/utils/colors.dart';
import 'package:automation_appium/utils/responsive_screen.dart';
import 'package:automation_appium/widgets/boxfield.dart';
import 'package:automation_appium/widgets/tabs_chips.dart';
import 'package:automation_appium/widgets/upper_curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
   State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Screen size;
  int _selectedIndex = 1;

  final List<Property> premiumList = [];
  final List<Property> featuredList = [];
  final List<String> citiesList = [
    "Ahmedabad",
    "Mumbai",
    "Delhi ",
    "Chennai",
    "Goa",
    "Kolkata",
    "Indore",
    "Jaipur"
  ];

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: backgroundColor),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[upperPart()],
          ),
        ),
      ),
    );
  }

  Padding buildChoiceChip(int index, String chipName) {
    return Padding(
      padding: EdgeInsets.only(left: size.getWidthPx(8)),
      child: ChoiceChip(
        backgroundColor: backgroundColor,
        selectedColor: colorCurve,
        labelStyle: TextStyle(
            fontFamily: 'Exo2',
            color:
                (_selectedIndex == index) ? backgroundColor : textPrimaryColor),
        elevation: 4.0,
        padding: EdgeInsets.symmetric(
            vertical: size.getWidthPx(4), horizontal: size.getWidthPx(12)),
        selected: _selectedIndex == index,
        label: Text(chipName),
        onSelected: (bool selected) {
          if (selected) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    premiumList
      ..add(
        Property(
          id: '1',
          propertyName: "Omkar Lotus",
          propertyLocation: "Ahmedabad ",
          image: "feature_1.jpg",
          propertyPrice: "26.5 Cr",
          propertyDesc: '',
        ),
      )
      ..add(
        Property(
          id: '2',
          propertyName: "Sandesh Heights",
          propertyLocation: "Baroda ",
          image: "feature_2.jpg",
          propertyPrice: "11.5 Cr",
          propertyDesc: '',
        ),
      );
  }

  Padding leftAlignText({String? text, required double leftPadding, required Color textColor, required double fontSize, FontWeight? fontWeight}) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text ?? "",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'Exo2',
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: textColor),
        ),
      ),
    );
  }

  Card propertyCard(Property property) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      borderOnForeground: true,
      child: SizedBox(
        height: size.getWidthPx(150),
        width: size.getWidthPx(170),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.asset(
                'assets/${property.image}',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: size.getWidthPx(8)),
            leftAlignText(
                text: property.propertyName,
                leftPadding: size.getWidthPx(8),
                textColor: colorCurve,
                fontSize: 14.0),
            leftAlignText(
                text: property.propertyLocation,
                leftPadding: size.getWidthPx(8),
                textColor: Colors.black54,
                fontSize: 12.0),
            SizedBox(height: size.getWidthPx(4)),
            leftAlignText(
                text: property.propertyPrice,
                leftPadding: size.getWidthPx(8),
                textColor: colorCurve,
                fontSize: 14.0,
                fontWeight: FontWeight.w800),
          ],
        ),
      ),
    );
  }

  Text titleWidget() {
    return const Text("Which type of house\nwould you like to buy?",
        style: TextStyle(
            fontFamily: 'Exo2',
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
            color: Colors.white));
  }

  Card upperBoxCard() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(
          horizontal: size.getWidthPx(20), vertical: size.getWidthPx(16)),
      borderOnForeground: true,
      child: SizedBox(
        height: size.getWidthPx(150),
        child: Column(
          children: <Widget>[
            _searchWidget(),
            leftAlignText(
                text: "Top Cities :",
                leftPadding: size.getWidthPx(16),
                textColor: textPrimaryColor,
                fontSize: 16.0),
            HorizontalList(
              children: <Widget>[
                for (int i = 0; i < citiesList.length; i++)
                  buildChoiceChip(i, citiesList[i])
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget upperPart() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: UpperClipper(),
          child: Container(
            height: size.getWidthPx(240),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorCurve, colorCurveSecondary],
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: size.getWidthPx(36)),
              child: Column(
                children: <Widget>[
                  titleWidget(),
                  SizedBox(height: size.getWidthPx(10)),
                  upperBoxCard(),
                ],
              ),
            ),
            leftAlignText(
                text: "Premium properties",
                leftPadding: size.getWidthPx(16),
                textColor: textPrimaryColor,
                fontSize: 16.0),
            HorizontalList(
              children: <Widget>[
                for (int i = 0; i < premiumList.length; i++)
                  propertyCard(premiumList[i])
              ],
            ),
            leftAlignText(
                text: "Featured properties",
                leftPadding: size.getWidthPx(16),
                textColor: textPrimaryColor,
                fontSize: 16.0),
            HorizontalList(
              children: <Widget>[
                for (int i = 0; i < premiumList.length; i++)
                  propertyCard(premiumList.reversed.toList()[i])
              ],
            )
          ],
        ),
      ],
    );
  }

  BoxField _searchWidget() {
    return BoxField(
      controller: TextEditingController(),
      focusNode: FocusNode(),
      hintText: "Select by city, area or locality.",
      labelText: "Search...",
      obscureText: false,
      onSaved: (String? val) {},
      icon: Icons.search,
      iconColor: colorCurve,
    );
  }
}