import 'package:food_delivery/routes.dart';
import 'package:food_delivery/state/bot_menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BotMenuState(),
      child: const MainApp(),
    ),
  );
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
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
        );
      },
    );
  }
}
