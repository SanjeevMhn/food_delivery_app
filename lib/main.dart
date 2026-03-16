import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/routes.dart';
import 'package:food_delivery/state/bot_menu_state.dart';
import 'package:food_delivery/state/cart_state.dart';
import 'package:food_delivery/state/drawer_state.dart';
import 'package:food_delivery/state/favorite_state.dart';
import 'package:food_delivery/state/foods_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteState()),
        ChangeNotifierProvider(create: (_) => CartState()),
        ChangeNotifierProvider(create: (_) => FoodsState()),
        ChangeNotifierProvider(create: (_) => BotMenuState()),
        ChangeNotifierProvider(create: (_) => DrawerState()),
      ],
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
