import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  const ButtonOne({super.key,
    required this.onPressed,
    this.widget,
    this.title = 'Null',
    this.titleSize = 20,
    this.elevation = 0,
    this.borderRadius = 5,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.backgroundColor = Colors.redAccent,
    this.titleColor = Colors.white,
    this.borderColor = Colors.redAccent,
    this.borderWidth,

  });
  final Function() onPressed;
  final Widget? widget;
  final String? title;
  final double? titleSize,elevation, borderRadius,width,height,borderWidth;
  final EdgeInsetsGeometry? padding, margin;
  final Color? backgroundColor, titleColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: width,
        height: height,
        child: RawMaterialButton(
          padding: padding ?? EdgeInsets.symmetric(vertical: 10,horizontal: 10),
         onPressed: onPressed,
          elevation: elevation!,
          fillColor: borderWidth != null? Colors.transparent : backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            side: BorderSide(color: borderColor!,width: borderWidth ?? 0),
          ),
          child: widget ?? Text(title!,style: TextStyle(
              color: borderWidth != null ? borderColor : titleColor,fontSize: titleSize,fontWeight: FontWeight.w500,
          ),
          )
        ),
      ),
    );
  }
}

