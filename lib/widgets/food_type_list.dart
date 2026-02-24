import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/food_type.dart';
import 'package:food_delivery/widgets/food_type_card.dart';

class FoodTypeList extends StatelessWidget {
  final String food_type;
  List<FoodType> foodList = [
    FoodType(
      id: 1,
      name: 'Cheese Pizza',
      image: 'assets/images/pizza.png',
      description: 'Cheese Pizza, Japan is turning footsteps into electricity.',
      rating: 4.8,
      price: 32.55,
    ),
    FoodType(
      id: 2,
      name: 'Apple Pancake',
      image: 'assets/images/pancakes.jpg',
      description:
          'Apple Pancake, Japan is turning footsteps into electricity.',
      rating: 5.0,
      price: 50.55,
    ),
  ];
  FoodTypeList({super.key, required this.food_type});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 30.r,
          left: 25.r,
          right: 25.r,
          bottom: 25.r,
        ),
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
                return FoodTypeCard(food: foodList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
