import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/cart_item_model.dart';
import 'package:food_delivery/models/food_detail_model.dart';
import 'package:food_delivery/state/cart_state.dart';
import 'package:food_delivery/state/foods_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  final int id;
  const FoodDetailPage({super.key, required this.id});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    FoodDetailModel foodDetail = context.read<FoodsState>().getFoodById(
      widget.id,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Color.fromRGBO(245, 203, 88, 1),
            padding: EdgeInsets.only(
              top: 50.r,
              left: 15.r,
              right: 15.r,
              bottom: 15.r,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/');
                        }
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        color: Color.fromRGBO(233, 83, 34, 1),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              foodDetail.name,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color.fromRGBO(57, 23, 19, 1),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Container(
                              width: 8.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(233, 83, 34, 1),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.r,
                            vertical: 2.r,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.sp),
                            color: Color.fromRGBO(233, 83, 34, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 2.r,
                            children: [
                              Text(
                                foodDetail.ratings.toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: Color.fromRGBO(244, 186, 27, 1),
                                size: 15.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(233, 83, 34, 1),
                  ),
                  child: Icon(Icons.favorite, color: Colors.white, size: 18.sp),
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
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(foodDetail.image, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$${foodDetail.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(233, 83, 34, 1),
                        ),
                      ),
                      Row(
                        spacing: 25.r,
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Color.fromRGBO(
                                233,
                                83,
                                34,
                                quantity > 1 ? 1 : 0.5,
                              ),
                            ),
                            color: Colors.white,
                            icon: Icon(Icons.remove),
                            iconSize: 20.sp,
                            onPressed: decreaseQuantity,
                          ),
                          Text(
                            "$quantity",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Color.fromRGBO(57, 23, 19, 1),
                            ),
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Color.fromRGBO(233, 83, 34, 1),
                            ),
                            color: Colors.white,
                            icon: Icon(Icons.add),
                            iconSize: 20.sp,
                            onPressed: increaseQuantity,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Divider(color: Color.fromRGBO(233, 83, 34, 0.6)),
                  SizedBox(height: 15.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodDetail.name,
                        style: TextStyle(
                          color: Color.fromRGBO(57, 23, 19, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      if (foodDetail.description != null)
                        Text(
                          foodDetail.description!,
                          style: TextStyle(
                            color: Color.fromRGBO(57, 23, 19, 1),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 30.h),
                      Center(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Color.fromRGBO(233, 83, 34, 1),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            context.read<CartState>().addToCart(
                              CartItemModel(
                                id: foodDetail.id,
                                name: foodDetail.name,
                                ratings: foodDetail.ratings,
                                image: foodDetail.image,
                                price: foodDetail.price,
                                quantity: quantity,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Item added to cart!")),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10.r,
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.white,
                                  size: 35.r,
                                ),
                                Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
