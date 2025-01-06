import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:testone/constant/assets_data.dart';

class AdsBanner extends StatelessWidget {
  const AdsBanner({
    super.key,
    required this.onPageChanged,
  });

  final Function(int index, CarouselPageChangedReason reason) onPageChanged;
  static const List<Color> colors = [Colors.redAccent,Colors.lightGreen,Colors.orangeAccent];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        padEnds: false,
        viewportFraction: 1.0,
        height: 120,
        initialPage: 1,
        onPageChanged: onPageChanged,
      ),
      items: List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16,left: 20,right: 20),
          alignment: Alignment.center,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsList.webBanners(index)),fit: BoxFit.cover),
            color: colors[index],
            borderRadius: BorderRadius.circular(5),
          ),
        );
      },),
    );
  }
}