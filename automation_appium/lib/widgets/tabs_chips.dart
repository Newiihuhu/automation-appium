import 'package:automation_appium/utils/responsive_screen.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  final List<Widget>? children;
  final ScrollPhysics? scrollPhysics;

  const HorizontalList({
    super.key,
    this.children,
    this.scrollPhysics,
  });

  @override
  State<StatefulWidget> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  late Screen size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return Container(
      padding: EdgeInsets.all(size.getWidthPx(4)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Row(
          children: widget.children ?? [],
        ),
      ),
    );
  }
}
