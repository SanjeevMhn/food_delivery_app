import 'package:food_delivery/widgets/adverts/30_percent_off.dart';
import 'package:food_delivery/widgets/best_seller_card.dart';
import 'package:food_delivery/widgets/bot_menu.dart';
import 'package:food_delivery/widgets/carousel.dart';
import 'package:food_delivery/widgets/recommeded_item.dart';
import 'package:food_delivery/widgets/search_input.dart';
import 'package:food_delivery/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDeliveryHomePage extends StatelessWidget {
  const FoodDeliveryHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                color: Color.fromRGBO(245, 203, 88, 1),
                padding: EdgeInsets.only(
                  top: 50.r,
                  left: 25.r,
                  right: 25.r,
                  bottom: 25.r,
                ),
                child: Column(
                  spacing: 15.r,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 30.r,
                      children: [
                        SearchInput(),
                        Row(
                          spacing: 7.r,
                          children: [
                            TopMenu(icon: Icons.shopping_cart_outlined),
                            TopMenu(icon: Icons.notifications_none_rounded),
                            TopMenu(icon: Icons.person_outline),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rise and shine! It's breakfast time",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Color.fromRGBO(233, 83, 34, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromRGBO(245, 203, 88, 1),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.r,
                    vertical: 30.r,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BotMenu(
                            icon: Icons.lunch_dining_outlined,
                            label: "Snack",
                          ),
                          BotMenu(
                            icon: Icons.restaurant_outlined,
                            label: "Meal",
                          ),
                          BotMenu(
                            icon: Icons.local_florist_outlined,
                            label: "Vegan",
                          ),
                          BotMenu(icon: Icons.cake_outlined, label: "Dessert"),
                          BotMenu(
                            icon: Icons.local_bar_outlined,
                            label: "Drinks",
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),
                      Divider(color: Color.fromRGBO(233, 83, 34, 1)),
                      SizedBox(height: 10.h),
                      Column(
                        spacing: 10.r,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Best Seller",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(57, 23, 19, 1),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "View All",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(233, 83, 34, 1),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Color.fromRGBO(233, 83, 34, 1),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 15.r,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BestSellerCard(
                                  image: 'assets/images/pancakes.jpg',
                                  price: 110.35,
                                ),
                                BestSellerCard(
                                  image: 'assets/images/chowmein.jpg',
                                  price: 50.25,
                                ),
                                BestSellerCard(
                                  image: 'assets/images/food.jpg',
                                  price: 12.99,
                                ),
                                BestSellerCard(
                                  image: 'assets/images/food_2.jpg',
                                  price: 8.25,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      ThirtyPercentOffAd(),
                      SizedBox(height: 30.h),
                      Column(
                        spacing: 20.r,
                        children: [
                          Container(
                            alignment: AlignmentGeometry.centerLeft,
                            child: Text(
                              "Recommended",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Color.fromRGBO(57, 23, 19, 1),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),

                          GridView.count(
                            primary: false,
                            crossAxisSpacing: 8.r,
                            mainAxisSpacing: 8.r,
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              RecommededItem(
                                image: 'assets/images/rec_1.jpg',
                                price: 12.50,
                                rating: 5.0,
                              ),
                              RecommededItem(
                                image: 'assets/images/rec_2.jpg',
                                price: 120.10,
                                rating: 4.0,
                              ),
                              RecommededItem(
                                image: 'assets/images/rec_3.jpg',
                                price: 45.50,
                                rating: 4.8,
                              ),
                              RecommededItem(
                                image: 'assets/images/rec_4.jpg',
                                price: 25.0,
                                rating: 5.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
