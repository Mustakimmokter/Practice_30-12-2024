import 'package:get/get.dart';
import 'package:testone/infrastructure/route.dart';

class LoadingController extends GetxController {
   Rx isLoading = false.obs;

  void getLoading (context){
   isLoading.value = true;
    Future.delayed(Duration(seconds: 1),()async {
     Get.toNamed(AppRoute.successScreen);
     isLoading.value = false;
   },);
  }
}