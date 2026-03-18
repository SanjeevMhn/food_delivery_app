import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/food_detail_model.dart';
import 'package:food_delivery/models/food_type.dart';
import 'package:food_delivery/state/bot_menu_state.dart';
import 'package:food_delivery/state/foods_state.dart';
import 'package:food_delivery/widgets/food_type_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FoodTypeList extends StatelessWidget {
  final String food_type;
  const FoodTypeList({super.key, required this.food_type});

  @override
  Widget build(BuildContext context) {
    List<FoodDetailModel> foodList = context.read<FoodsState>().getFoods;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 30.r,
          left: 25.r,
          right: 25.r,
          bottom: 25.r,
        ),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 6.r,
                  children: [
                    Text(
                      "Sort By",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color.fromRGBO(7, 7, 7, 1),
                      ),
                    ),
                    Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color.fromRGBO(233, 83, 34, 1),
                      ),
                    ),
                  ],
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color.fromRGBO(233, 83, 34, 1),
                  ),
                  child: Center(
                    child: Icon(Icons.tune_outlined, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // FoodTypeCard( food: null,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<BotMenuState>().resetActiveBotMenu();
                    context.go("/detail/${foodList[index].id}/foodtype");
                  },
                  child: FoodTypeCard(
                    food: FoodType(
                      id: foodList[index].id,
                      name: foodList[index].name,
                      image: Hero(
                        tag: 'foodtype-${foodList[index].id}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.asset(
                              foodList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      description: foodList[index].description ?? '',
                      rating: foodList[index].ratings,
                      price: foodList[index].price,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
