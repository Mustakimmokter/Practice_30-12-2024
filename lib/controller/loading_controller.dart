import 'package:get/get.dart';
import 'package:testone/infrastructure/route.dart';

class LoadingController extends GetxController {
   final Rx _isLoading = false.obs;

   RxInt get isLoading => _isLoading.value;

  void getLoading (context){
   _isLoading.value = true;
    Future.delayed(Duration(seconds: 1),()async {
     Get.toNamed(AppRoute.successScreen);
     _isLoading.value = false;
   },);
  }
}