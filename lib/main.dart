import 'package:food_delivery/pages/food_delivery_home_page.dart';
// import 'package:expense_tracker/pages/home_page.dart';
// import 'package:expense_tracker/widgets/bottom_navigator.dart';
import 'package:food_delivery/widgets/food_delivery_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 952),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, context) {
        return MaterialApp(
          home: SafeArea(
            child: Scaffold(
              extendBody: true,
              // body: HomePage(),
              body: FoodDeliveryHomePage(),
              // bottomNavigationBar: BottomNavigator()
              bottomNavigationBar: FoodDeliveryBottomNav() 
            ),
          ),
        );
      },
    );
  }
}
