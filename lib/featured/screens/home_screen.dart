import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testone/controller/banner_indicator_controller.dart';
import 'package:testone/controller/loading_controller.dart';
import 'package:testone/widgets/icon_button.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

   static const List<Color> colors= [Colors.redAccent,Colors.lightGreen,Colors.orangeAccent];
   static var controller = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    final LoadingController loadingController = Get.put(LoadingController());
    final BannerIndicatorController bannerIndicatorController = Get.put(BannerIndicatorController());
    final Size size = MediaQuery.of(context).size;
    final double ratioSize = MediaQuery.devicePixelRatioOf(context);
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                padEnds: false,
                viewportFraction: 1.0,
                height: 150,
                initialPage: 1,
                onPageChanged: (index, reason) {
                  bannerIndicatorController.getIndicator(index);
                },
              ),
              items: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('${index+1}. Ads Banner',
                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
                  ),
                );
              },),
              //carouselController: CarouselSliderController(),
            ),
            Obx(() {
              return Positioned(
                left: 150,
                bottom: 30,
                child: AnimatedSmoothIndicator(
                  activeIndex: bannerIndicatorController.activeIndicator,
                  count:  3,
                  effect:  ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.grey.shade400,
                      dotHeight: 10,
                      dotWidth: 10
                  ),
                )  ,
              );
            },),
          ],
        ),
      ],
    );
  }
}
