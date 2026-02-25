import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key});

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
                              "Cheese Pizza",
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
                                "5.0",
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
                      child: Image.asset(
                        "assets/images/pizza.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$50.00",
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
                        "Cheese Pizza",
                        style: TextStyle(
                          color: Color.fromRGBO(57, 23, 19, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        "Japan is turning footsteps into electricity...",
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
                      Text(
                        "Toppings",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color.fromRGBO(57, 23, 19, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RadioGroup(
                        onChanged: (value) {},
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text(
                                "Cheese",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(57, 23, 19, 1),
                                ),
                              ),
                              trailing: Radio(value: false),
                            ),
                            ListTile(
                              leading: Text(
                                "Pepperoni",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(57, 23, 19, 1),
                                ),
                              ),
                              trailing: Radio(value: false),
                            ),
                            ListTile(
                              leading: Text(
                                "Mushrooms",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(57, 23, 19, 1),
                                ),
                              ),
                              trailing: Radio(value: false),
                            ),
                            ListTile(
                              leading: Text(
                                "Olive Oil",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(57, 23, 19, 1),
                                ),
                              ),
                              trailing: Radio(value: false),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      Center(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Color.fromRGBO(233, 83, 34, 1),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {},
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
                      SizedBox(height: 30.h,)
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
