import 'package:automation_appium/utils/colors.dart';
import 'package:automation_appium/utils/responsive_screen.dart';
import 'package:automation_appium/presentation/widgets/boxfield.dart';
import 'package:automation_appium/presentation/widgets/tabs_chips.dart';
import 'package:automation_appium/presentation/widgets/upper_curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../models/water.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Screen size;
  int _selectedIndex = 1;
  TextEditingController controller = TextEditingController();
  final List<Water> watersList = [
    Water(
      id: '1',
      waterName: "Mont Fleur",
      image: "Mont-Fleur.jpeg",
      waterPrice: "฿18.00",
      waterDesc: 'Mont Fleur Mineral Water 1000ml.',
    ),
    Water(
      id: '2',
      waterName: "Purra",
      image: "Purra.jpg",
      waterPrice: "฿16.33",
      waterDesc: 'Purra. Purra Mineral Water 1500ML.',
    ),
    Water(
      id: '3',
      waterName: "Singha",
      image: "Singha.jpeg",
      waterPrice: "฿10.00",
      waterDesc:
          'น้ำสิงห์อุดมไปด้วยแคลเซียม ช่วยเสริมความแข็งแรงของกระดูกและฟัน',
    ),
    Water(
      id: '4',
      waterName: "Crystal",
      image: "Crystal.jpeg",
      waterPrice: "฿5.33",
      waterDesc:
          'น้ำดื่มคริสตัล ผ่านกระบวนการผลิตมาอย่างเคลียร์ถึง 19 ขั้นตอน เพื่อให้ได้น้ำดื่มคุณภาพ มาตฐานระดับสากล',
    ),
    Water(
      id: '5',
      waterName: "Aquafina",
      image: "aquafina.jpeg",
      waterPrice: "฿14.00",
      waterDesc: 'น้ำแร่ธรรมชาติ 100% อควาฟิน่า มิเนเรล',
    ),
    Water(
      id: '5',
      waterName: "Acqua Panna",
      image: "Acqua-Panna.jpeg",
      waterPrice: "฿79.00",
      waterDesc: 'ACQUA PANNA. อควา ปานน่า น้ำแร่ธรรมชาติ 750มล.',
    ),
  ];
  late List<Water> searchResults = [];

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[upperPart()],
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
    searchResults = watersList;
  }

  Padding leftAlignText(
      {String? text,
      required double leftPadding,
      required Color textColor,
      required double fontSize,
      FontWeight? fontWeight}) {
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

  Card waterCard(Water water) {
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
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.asset(
                  'assets/${water.image}',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: size.getWidthPx(8)),
            leftAlignText(
                text: water.waterName,
                leftPadding: size.getWidthPx(8),
                textColor: colorCurve,
                fontSize: 14.0),
            SizedBox(height: size.getWidthPx(4)),
            leftAlignText(
                text: water.waterPrice,
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
    return const Text(
      "Which brand of water\nwould you like to buy?",
      style: TextStyle(
        fontFamily: 'Exo2',
        fontSize: 24.0,
        fontWeight: FontWeight.w900,
        color: Colors.white,
      ),
    );
  }

  Card upperBoxCard() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(
          horizontal: size.getWidthPx(20), vertical: size.getWidthPx(16)),
      borderOnForeground: true,
      child: SizedBox(
        child: Column(
          children: <Widget>[
            _searchWidget(),
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
            SafeArea(
              child: Column(
                children: <Widget>[
                  titleWidget(),
                  SizedBox(height: size.getWidthPx(10)),
                  upperBoxCard(),
                ],
              ),
            ),
            staggeredBody()
          ],
        ),
      ],
    );
  }

  BoxField _searchWidget() {
    return BoxField(
      controller: controller,
      focusNode: FocusNode(),
      hintText: "Search by water name...",
      labelText: "Search...",
      obscureText: false,
      onSaved: (String? val) {
        setState(() {
          _handleSearch(controller.text);
        });
      },
      onChanged: (String? val) {
        setState(() {
          _handleSearch(controller.text);
        });
      },
      icon: Icons.search,
      iconColor: colorCurve,
    );
  }

  Widget staggeredBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.getWidthPx(8)),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(
          searchResults.length,
          (index) {
            return waterCard(searchResults.reversed.toList()[index]);
          },
        ),
      ),
    );
  }

  void _handleSearch(String input) {
    searchResults = [];
    for (var str in watersList) {
      if (str.waterName.toLowerCase().contains(input.toLowerCase())) {
        setState(() {
          searchResults.add(str);
        });
      }
    }
  }
}
