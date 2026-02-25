import 'package:food_delivery/layouts/main_layout.dart';
import 'package:food_delivery/pages/food_delivery_home_page.dart';
import 'package:food_delivery/pages/food_detail_page.dart';
import 'package:food_delivery/state/bot_menu_state.dart';
// import 'package:expense_tracker/pages/home_page.dart';
// import 'package:expense_tracker/widgets/bottom_navigator.dart';
import 'package:food_delivery/widgets/food_delivery_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BotMenuState(),
      child: const MainApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainLayout(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const FoodDeliveryHomePage(),
            ),
            GoRoute(
              path: '/detail',
              builder: (context, state) => const FoodDetailPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

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
          routerConfig: _router,
        );
      },
    );
  }
}
