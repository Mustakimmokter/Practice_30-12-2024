
import 'package:flutter/material.dart';

class TextButtonOne extends StatelessWidget {
  const TextButtonOne({super.key, this.text, required this.onTap, this.widget, this.size,this.color});
  final String? text;
  final VoidCallback onTap;
  final Widget? widget;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: widget ?? Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text ??'',
          style: TextStyle(
              fontSize: size ?? 16,
              fontWeight: FontWeight.w500,
              color: color ?? Colors.redAccent
          ),
        ),
      ),
    );
  }
}
