import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
    );
  }
}
