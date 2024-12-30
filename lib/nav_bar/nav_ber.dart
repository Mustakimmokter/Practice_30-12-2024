import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key,
    required this.onTap,
    required this.label,
    required this.length,
    required this.icons,
    this.floatSize = 5,

  });
  final Function(int value) onTap;
  final List<String> label;
  final List<IconData> icons;
  final int length;
  final double? floatSize;

  //static const List _label = ['Profile','Favorite','History','Settings'];

  @override
  Widget build(BuildContext context) {
    final double sizeOf = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(length, (index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  onTap(index);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(icons[index],color: Colors.white,),
                    Text(label[index],style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              index == 1? SizedBox(width: sizeOf / floatSize!) :SizedBox(),
            ],
          );
        },),
      ),
    );
  }
}
