import 'package:flutter/material.dart';
import 'package:testone/featured/screens/successful_screen.dart';
import 'package:testone/nav_bar/screen_controller.dart';
import 'package:testone/widgets/custom_page_transition.dart';


class AppRoute {
 static const String homeScreen = '/';
 static const String successScreen = '/SuccessScreen';

  static Route<dynamic> onGenerateRoute (RouteSettings settings){

    switch(settings.name){
      case '/':
        return CustomPageTransition.pageRoute(page: NavBarScreenController(),settings: settings);
      case '/SuccessScreen':
        return CustomPageTransition.pageRoute(page: SuccessfulScreen(),settings: settings);
    }
    return MaterialPageRoute(builder: (context) => NavBarScreenController());
  }

}