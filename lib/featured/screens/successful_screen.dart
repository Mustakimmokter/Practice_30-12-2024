import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testone/infrastructure/route.dart';
import 'package:testone/widgets/text_button_one.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline,size: 100,color: Colors.redAccent,),
            Text('Payment Successful',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                'Lorem Ipsum has been the industry\'s standard dummy text ever since the dummy text',
            textAlign: TextAlign.center,
            ),
            TextButtonOne(
              onTap: () {
                Get.offAllNamed(AppRoute.homeScreen);
              },
              text: 'Back To Home',
            ),
          ],
        ),
      ),
    );
  }
}
