import 'package:automation_appium/utils/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotosList extends StatefulWidget {
  @override
  _PhotosListState createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  bool isLoading = true;
  bool internetCheck = true;
  List<String> photoList = [];
  late Screen size;

  @override
  void initState() {
    super.initState();
    fetchRandomPhotos();
  }

  void fetchRandomPhotos() async {
    photoList = List.generate(
        30, (index) => "https://source.unsplash.com/random?sig=$index");
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : staggeredBody();
  }

  Widget staggeredBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.getWidthPx(8)),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(
          photoList.length,
          (index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size.getWidthPx(12)),
              ),
              child: Image.network(
                photoList[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
