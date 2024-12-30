import 'package:flutter/material.dart';

class CustomPageTransition {

  static PageRouteBuilder<dynamic> pageRoute({required Widget page, RouteSettings? settings}){

    return PageRouteBuilder<dynamic>(
      pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
      settings: settings,
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder:(context, animation, secondaryAnimation, child) {
        return SlideTransition(position: animation.drive(Tween(begin: Offset(1, 0,),end: Offset(0, 0))),
        child: child,
        );
      },

     );

  }

}