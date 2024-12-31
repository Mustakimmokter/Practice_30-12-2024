import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerIndicatorController extends GetxController {

  final Rx _activeIndicator = 1.obs;
  int get activeIndicator => _activeIndicator.value;

  void getIndicator (int index){
    _activeIndicator.value = index;
  }






}