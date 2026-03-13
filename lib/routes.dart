import 'package:flutter/material.dart';
import 'package:food_delivery/layouts/main_layout.dart';
import 'package:food_delivery/pages/checkout_page.dart';
import 'package:food_delivery/pages/food_delivery_home_page.dart';
import 'package:food_delivery/pages/food_detail_page.dart';
import 'package:food_delivery/pages/login_page.dart';
import 'package:food_delivery/pages/order_confirmed_page.dart';
import 'package:food_delivery/pages/signup_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
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
              path: '/login',
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              path: '/signup',
              builder: (context, state) => const SignupPage(),
            ),
            GoRoute(
              path: '/',
              builder: (context, state) => const FoodDeliveryHomePage(),
            ),
            GoRoute(
              path: '/detail/:id',
              builder: (context, state) {
                final String? rawId = state.pathParameters['id'];
                if (rawId != null) {
                  final int id = int.parse(rawId);  
                  return FoodDetailPage(id: id);
                }
                return Placeholder();
              },
            ),
            GoRoute(
              path: '/confirm',
              builder: (context, state) => const CheckoutPage()
            ),
            GoRoute(
              path: '/confirm_success',
              builder: (context, state) => const OrderConfirmedPage() 
            )
          ],
        ),
      ],
    ),
  ],
);
