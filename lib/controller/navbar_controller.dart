import 'package:get/get.dart';

class NavbarController extends GetxController {

  final RxInt _screen = 0.obs;
  RxInt get screen  => _screen;

  void getNavBar(int value){
    _screen.value = value;
  }

}