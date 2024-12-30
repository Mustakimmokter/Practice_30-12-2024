import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testone/controller/navbar_controller.dart';
import 'package:testone/featured/screens/favorite_screen.dart';
import 'package:testone/featured/screens/home_screen.dart';
import 'package:testone/featured/screens/profile_screen.dart';
import 'package:testone/featured/screens/setting_screen.dart';
import 'package:testone/nav_bar/nav_ber.dart';
import 'package:animations/animations.dart';

class NavBarScreenController extends StatelessWidget {
  const NavBarScreenController({super.key});
  static const List<Widget> _screens = [
    HomeScreen(),
    ProfileScreen(),
    FavoriteScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final NavbarController navBarController = Get.put(NavbarController());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("This is test"),
        backgroundColor: Colors.grey.shade200,
        elevation: 5,
        centerTitle: true,
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),

      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        color: Colors.redAccent,
        height: 60,
        child: NavBar(
          length: 4,
          icons: [Icons.home_filled,Icons.person,Icons.favorite,Icons.settings],
          onTap: (value) {
            navBarController.getNavBar(value);
          },
          label: ['Home','Profile','Favorite','Setting'],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 6,
        child: Icon(Icons.add,size: 30,color: Colors.white,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Obx(() {
        return  PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeThroughTransition(animation: primaryAnimation, secondaryAnimation: secondaryAnimation,child: child);
          },
          child: _screens[navBarController.screen.value],
        );
      },),
    );
  }
}
