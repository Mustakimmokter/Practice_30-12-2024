import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton ({super.key,
    required this.onTap,
    this.iconData = Icons.add,
    this.color = Colors.redAccent,
    this.size = 24,
    this.child,
  });
  final VoidCallback onTap;
  final IconData? iconData;
  final Color? color;
  final double? size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child ?? Icon(iconData,color: color,size: size,),

    );
  }
}
