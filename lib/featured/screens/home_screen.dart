import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testone/constant/constant_data.dart';
import 'package:testone/controller/banner_indicator_controller.dart';
import 'package:testone/controller/loading_controller.dart';
import 'package:testone/widgets/ads_banner.dart';
import 'package:testone/widgets/custom_icon_button.dart';
import 'package:testone/widgets/round_icon_button.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoadingController loadingController = Get.put(LoadingController());
    final int length = 20;
    final BannerIndicatorController bannerIndicatorController = Get.put(BannerIndicatorController());
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Ads Banner
            Stack(
              children: [
                AdsBanner(
                  onPageChanged: (index, reason) {
                    bannerIndicatorController.getIndicator(index);

                  },
                ),
                Obx(() {
                  return Positioned(
                    left: size.width / 2.5,
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
            ///
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      RoundIconButton (),
                      Text('Products'),
                    ],
                  );
                },),
              ),
            ),
            Column(
              children: List.generate(ConstantData.productsCategory().length, (listIndex) {
                return Column(
                  children: [
                    /// Best Deals
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(ConstantData.productsCategory()[listIndex],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3,horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text('See All',style: TextStyle(color: Colors.white,fontSize: 12),),
                          ),

                        ],
                      ),
                    ),
                    Divider(indent: 20,endIndent: 20,),
                    SizedBox(
                      height: 260,
                      width: double.maxFinite,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemCount: ConstantData.productsDetails()[listIndex]['Description']?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, contentIndex) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right : 12,top: 5),
                                height: 260,
                                width: 200,
                                child: Column(
                                  children: [
                                    Text(
                                      ConstantData.productsDetails()[listIndex]['Description']![contentIndex],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Image.asset(ConstantData.productsDetails()[listIndex]['Tv']![contentIndex],width: 140,),
                                  ],
                                ),
                              ),
                             listIndex == ConstantData.productsDetails()[listIndex]['Description']!.length-1? SizedBox() : VerticalDivider(indent: 20,endIndent: 20,),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },),
            ),
          ],
        ),
      ),
    );
  }
}
