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

  @override
  Widget build(BuildContext context) {
    final double sizeOf = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 70,
      color: Colors.redAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(length, (index) {
          return Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  onTap(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(icons[index],color: Colors.white,),
                      Text(label[index],style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ],
          );
        },),
      ),
    );
  }
}
