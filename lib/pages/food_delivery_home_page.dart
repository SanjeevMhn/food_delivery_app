import 'package:food_delivery/models/best_seller.dart';
import 'package:food_delivery/models/recommeded_item_model.dart';
import 'package:food_delivery/widgets/adverts/thirty_percent_off.dart';
import 'package:food_delivery/widgets/best_seller_card.dart';
import 'package:food_delivery/widgets/bot_menu.dart';
import 'package:food_delivery/models/bot_menu_model.dart';
import 'package:food_delivery/widgets/recommeded_item.dart';
import 'package:food_delivery/widgets/search_input.dart';
import 'package:food_delivery/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDeliveryHomePage extends StatefulWidget {
  const FoodDeliveryHomePage({super.key});

  @override
  State<FoodDeliveryHomePage> createState() => _FoodDeliveryHomePageState();
}

class _FoodDeliveryHomePageState extends State<FoodDeliveryHomePage> {
  List<BestSeller> bestSellers = [
    BestSeller(id: 1, price: 110.35, image: 'assets/images/pancakes.jpg'),
    BestSeller(id: 2, price: 50.25, image: 'assets/images/chowmein.jpg'),
    BestSeller(id: 3, price: 12.99, image: 'assets/images/food.jpg'),
    BestSeller(id: 4, price: 8.25, image: 'assets/images/food_2.jpg'),
    BestSeller(id: 5, price: 28.25, image: 'assets/images/pizza.png'),
  ];

  List<BotMenuModel> botMenus = [
    BotMenuModel(id: 1, icon: Icons.lunch_dining_outlined, label: "Snack"),
    BotMenuModel(id: 2, icon: Icons.restaurant_outlined, label: "Meal"),
    BotMenuModel(id: 3, icon: Icons.cake_outlined, label: "Desserts"),
    BotMenuModel(id: 4, icon: Icons.local_bar_outlined, label: "Drinks"),
  ];

  List<RecommededItemModel> recommededItems = [
    RecommededItemModel(
      id: 1,
      image: 'assets/images/rec_1.jpg',
      price: 12.50,
      rating: 5.0,
    ),
    RecommededItemModel(
      id: 2,
      image: 'assets/images/rec_2.jpg',
      price: 120.10,
      rating: 4.2,
    ),
    RecommededItemModel(
      id: 3,
      image: 'assets/images/rec_3.jpg',
      price: 45.50,
      rating: 4.8,
    ),
    RecommededItemModel(
      id: 4,
      image: 'assets/images/rec_4.jpg',
      price: 25.65,
      rating: 5.0,
    ),
  ];

  void toggleActive(int id) {
    setState(() {
      List<BotMenuModel> newBotMenu = botMenus.map((item) {
        return BotMenuModel(
          id: item.id,
          icon: item.icon,
          label: item.label,
          isActive: false,
        );
      }).toList();
      botMenus = newBotMenu;
      var item = botMenus.firstWhere((item) => item.id == id);
      item.isActive = !item.isActive;
    });
  }

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
                  padding: EdgeInsets.only(left: 25.r, right: 25.r, top: 30.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    ),
                    color: botMenus.any((item) => item.isActive == true)
                        ? Color.fromRGBO(233, 83, 34, 1)
                        : Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: botMenus
                            .map(
                              (item) => GestureDetector(
                                onTap: () => toggleActive(item.id),
                                child: BotMenu(botMenu: item),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              homePage(bestSellers, recommededItems),
            ],
          ),
        ],
      ),
    );
  }
}

Widget homePage(
  List<BestSeller> bestSellers,
  List<RecommededItemModel> recommededItems,
) {
  return Container(
    // color: Color.fromRGBO(233, 83, 34, 1),
    color: Colors.white,
    child: Container(
      padding: EdgeInsets.only(left: 25.r, right: 25.r, top: 30.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(50.r)),
      ),
      child: Column(
        children: [
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
                        color: Color.fromRGBO(57, 49, 47, 1),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestSellers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 15.r),
                      child: BestSellerCard(bestSeller: bestSellers[index]),
                    );
                  },
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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemCount: recommededItems.length,
                itemBuilder: (context, index) {
                  return RecommededItem(item: recommededItems[index]);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
