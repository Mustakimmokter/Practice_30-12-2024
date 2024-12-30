import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testone/controller/loading_controller.dart';
import 'package:testone/controller/navbar_controller.dart';
import 'package:testone/widgets/button_one.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoadingController loadingController = Get.put(LoadingController());
    final NavbarController navBarController = Get.put(NavbarController());
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: List.generate(20, (index) {
                return Container(
                  margin: EdgeInsets.only(left: 20,right: 20, bottom: 16),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment : MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${index+1}. This is me"),
                      ButtonOne(
                        icon: Icons.favorite,
                        onTap: () {
                          if (kDebugMode) {
                            print(index+1);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },),
            ),
          ),
        ),
        SizedBox(height: 20),
        ButtonOne(
          onTap: (){
            loadingController.getLoading(context);
          },
          widget: Container(
            width: double.maxFinite,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              //borderRadius: BorderRadius.circular(10),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3,),
                Text("SUBMIT",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500),),
                Spacer(flex: 2,),
                Obx(() {
                  return loadingController.isLoading == true ?  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ): SizedBox(  width: 30,
                    height: 30,
                  );
                },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
