import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testone/constant/constant_data.dart';
import 'package:testone/controller/banner_indicator_controller.dart';
import 'package:testone/controller/loading_controller.dart';
import 'package:testone/widgets/ads_banner.dart';
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
              children: List.generate(ConstantData.allProducts().length, (listIndex) {
                return Column(
                  children: [
                    /// Best Deals
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(ConstantData.allProducts()[listIndex].title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
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
                      height: 300,
                      width: double.maxFinite,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemCount: ConstantData.allProducts()[listIndex].items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, contentIndex) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right : 12,top: 5,left: 12),
                                //height: 260,
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ConstantData.allProducts()[listIndex].title == 'Shop By Brand' ? '' : ConstantData.allProducts()[listIndex].items[contentIndex].description,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    /// Product image and EMI
                                    Stack(
                                      children: [
                                        /// Stack size
                                        SizedBox(
                                            width: 200,
                                            height: 140,
                                          ),
                                        ///Product images
                                        Positioned(
                                          top: 20,
                                          left: 30,
                                          child: Image.asset(ConstantData.allProducts()[listIndex].items[contentIndex].img,width: 110,),
                                        ),
                                       ///EMI
                                        ConstantData.allProducts()[listIndex].title == 'Shop By Brand' ? SizedBox() :Positioned(
                                         right: 0,
                                         child: Stack(
                                           children: [
                                             Container(
                                               alignment: Alignment.center,
                                               height: 40,
                                               width: 40,
                                               decoration: BoxDecoration(
                                                 color: Colors.redAccent,
                                                 borderRadius: BorderRadius.circular(100),
                                                 boxShadow: [
                                                   BoxShadow(
                                                     color: Colors.grey.shade400,
                                                     blurRadius: 7,
                                                     offset: Offset(1, 1),
                                                   )
                                                 ],
                                               ),
                                             ),
                                             Positioned(
                                               left: 12,
                                               top: 5,
                                               child:  Text('EMI',
                                                 style: TextStyle(color: Colors.white,fontSize: 10),
                                                 textAlign: TextAlign.center,
                                               ),
                                             ),
                                             Positioned(
                                               left: 12,
                                               bottom: 3,
                                               child:  Text('${ConstantData.allProducts()[listIndex].items[contentIndex].emi}',
                                                 style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500,),
                                                 textAlign: TextAlign.center,
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                      ],
                                    ),
                                    /// EMI by tk/month
                                    Row(
                                      children: [
                                        Icon(Icons.account_balance_wallet_outlined,size: 18,),
                                        SizedBox(width: 5,),
                                        Text(ConstantData.allProducts()[listIndex].items[contentIndex].emiTkByMonth,style: TextStyle(fontSize: 12),),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Column(
                                         children: [
                                           /// New price
                                           Text('Tk ${ConstantData.allProducts()[listIndex].items[contentIndex].newPrice}',),
                                           /// New price
                                           Text('Tk ${ConstantData.allProducts()[listIndex].items[contentIndex].newPrice}',
                                             style: TextStyle(
                                               fontSize: 12,color: Colors.redAccent,
                                               decoration: TextDecoration.lineThrough,
                                               decorationColor: Colors.redAccent,
                                             ),
                                           ),
                                         ],
                                       ),
                                       Container(
                                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(5),
                                           color: Colors.redAccent
                                         ),
                                         child: Text(ConstantData.allProducts()[listIndex].items[contentIndex].discount,
                                         style: TextStyle(color: Colors.white,fontSize: 12),
                                         ),
                                       ),
                                     ],
                                   ),

                                  ],
                                ),
                              ),
                             contentIndex == ConstantData.allProducts()[listIndex].items.length-1? SizedBox(): VerticalDivider(indent: 20,endIndent: 20,),
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
