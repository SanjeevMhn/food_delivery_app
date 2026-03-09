import 'package:food_delivery/models/best_seller.dart';
import 'package:food_delivery/models/food_detail_model.dart';
import 'package:food_delivery/models/recommeded_item_model.dart';
import 'package:food_delivery/state/bot_menu_state.dart';
import 'package:food_delivery/state/drawer_state.dart';
import 'package:food_delivery/state/foods_state.dart';
import 'package:food_delivery/widgets/adverts/thirty_percent_off.dart';
import 'package:food_delivery/widgets/best_seller_card.dart';
import 'package:food_delivery/widgets/bot_menu.dart';
import 'package:food_delivery/widgets/food_type_list.dart';
import 'package:food_delivery/widgets/recommeded_item.dart';
import 'package:food_delivery/widgets/search_input.dart';
import 'package:food_delivery/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FoodDeliveryHomePage extends StatefulWidget {
  const FoodDeliveryHomePage({super.key});

  @override
  State<FoodDeliveryHomePage> createState() => _FoodDeliveryHomePageState();
}

class _FoodDeliveryHomePageState extends State<FoodDeliveryHomePage> {
  @override
  Widget build(BuildContext context) {
    final botMenus = context.watch<BotMenuState>().botMenus;
    final activeBotMenu = context.watch<BotMenuState>().currentActiveBotMenu();
    final hasActiveBotMenu = context.watch<BotMenuState>().hasActiveBotMenu();

    final foodList = context.watch<FoodsState>().getFoods;

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
                            TopMenu(
                              icon: Icons.shopping_cart_outlined,
                              onPressed: () {
                                context.read<DrawerState>().setDrawerType(
                                  DrawerType.cart,
                                );
                                Scaffold.of(context).openEndDrawer();
                              },
                            ),
                            TopMenu(
                              icon: Icons.notifications_none_rounded,
                              onPressed: () {
                                context.read<DrawerState>().setDrawerType(
                                  DrawerType.notifications,
                                );
                                Scaffold.of(context).openEndDrawer();
                              },
                            ),
                            TopMenu(
                              icon: Icons.person_outline,
                              onPressed: () {
                                context.read<DrawerState>().setDrawerType(
                                  DrawerType.profile,
                                );
                                Scaffold.of(context).openEndDrawer();
                              },
                            ),
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
                    color: hasActiveBotMenu
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
                                onTap: () => context
                                    .read<BotMenuState>()
                                    .setActiveBotMenu(item.id),
                                child: BotMenu(botMenu: item),
                              ),
                            )
                            .toList(),
                      ),
                      if (!hasActiveBotMenu) SizedBox(height: 10.h),
                      if (!hasActiveBotMenu)
                        Divider(color: Color.fromRGBO(233, 83, 34, 1)),
                    ],
                  ),
                ),
              ),

              switch (activeBotMenu) {
                'Snack' => FoodTypeList(food_type: 'Snack'),
                'Meal' => FoodTypeList(food_type: 'Meal'),
                'Vegan' => FoodTypeList(food_type: 'Vegan'),
                'Desserts' => FoodTypeList(food_type: 'Desserts'),
                'Drinks' => FoodTypeList(food_type: 'Drinks'),
                _ => homePage(foodList),
              },
            ],
          ),
        ],
      ),
    );
  }
}

Widget homePage(List<FoodDetailModel> foodList) {
  return Column(
    children: [
      Container(
        // color: Color.fromRGBO(233, 83, 34, 1),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 25.r, right: 25.r, top: 10.r),
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
                            color: Color.fromRGBO(233, 83, 34, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 15.r),
                          child: GestureDetector(
                            onTap: () {
                              context.go("/detail/${foodList[index].id}");
                            },
                            child: BestSellerCard(
                              bestSeller: BestSeller(
                                id: foodList[index].id,
                                price: foodList[index].price,
                                image: foodList[index].image,
                              ),
                            ),
                          ),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.0,
                        ),
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.go('/detail/${foodList[index].id}');
                        },
                        child: RecommededItem(
                          item: RecommededItemModel(
                            id: foodList[index].id,
                            image: foodList[index].image,
                            price: foodList[index].price,
                            rating: foodList[index].ratings,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
