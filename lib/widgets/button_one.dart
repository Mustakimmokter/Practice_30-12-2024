import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  const ButtonOne({super.key, required this.onTap,this.icon,this.widget});
  final Function() onTap;
  final Widget? widget;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: widget ?? Icon(icon,color: Colors.redAccent,),
    );
  }
}

