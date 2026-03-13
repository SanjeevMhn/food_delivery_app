import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/state/cart_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartState>().cart;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Color(0xFFF5CB58),
            padding: EdgeInsets.only(
              top: 35.r,
              left: 25.r,
              right: 25.r,
              bottom: 25.r,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  iconSize: 30.sp,
                  color: Color(0xFFE95322),
                  onPressed: () {
                    context.go('/');
                  },
                ),
                Text(
                  "Confirm Order",
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 30.w),
              ],
            ),
          ),
          Container(
            color: Color(0xFFF5CB58),
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.r),
                  topLeft: Radius.circular(50.r),
                ),
              ),
              padding: EdgeInsets.only(left: 25.r, right: 25.r, top: 25.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Summary",
                        style: TextStyle(
                          color: Color(0xFF391713),
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${cartItems.length} ${cartItems.length > 1 ? 'items' : 'item'}',
                        style: TextStyle(
                          color: Color(0xFF391713),
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Divider(color: Color(0xFFFFD8C7)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(color: Color(0xFFFFD8C7)),
              ),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 12.r,
                        children: [
                          Container(
                            width: 75.w,
                            height: 110.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              image: DecorationImage(
                                image: AssetImage(item.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Color(0xFF391713),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                useRootNavigator: true,
                                useSafeArea: true,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Remove Item"),
                                    content: Text("Remove item from order?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context
                                              .read<CartState>()
                                              .removeCartItem(item);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Remove'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.delete),
                            iconSize: 18.sp,
                            color: Color(0xFFE95322),
                            padding: EdgeInsets.zero,
                          ),
                          Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Color(0xFFE95322),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8.r,
                            children: [
                              SizedBox(
                                width: 25.w,
                                height: 25.h,
                                child: Center(
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Color(0xFFE95322),
                                      iconSize: 16.sp,
                                      shape: CircleBorder(),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<CartState>()
                                          .decreaseQuantity(item);
                                    },
                                  ),
                                ),
                              ),
                              Consumer<CartState>(
                                builder:
                                    (
                                      BuildContext context,
                                      data,
                                      Widget? child,
                                    ) {
                                      return Text(
                                        '${data.cart[index].quantity}',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                        ),
                                      );
                                    },
                              ),
                              SizedBox(
                                width: 25.w,
                                height: 25.h,
                                child: Center(
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.add, color: Colors.white),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Color(0xFFE95322),
                                      iconSize: 16.sp,
                                      shape: CircleBorder(),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<CartState>()
                                          .increaseQuantity(item);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 25.r),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.r),
                  child: Divider(color: Color(0xFFFFD8C7)),
                ),
                Consumer<CartState>(
                  builder: (BuildContext context, data, Widget? child) {
                    return Column(
                      spacing: 8.r,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                color: Color(0xFF391713),
                                fontSize: 22.sp,
                              ),
                            ),
                            Text(
                              '\$${data.getSubTotal().toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Color(0xFF391713),
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery",
                              style: TextStyle(
                                color: Color(0xFF391713),
                                fontSize: 22.sp,
                              ),
                            ),
                            Text(
                              '\$5.00',
                              style: TextStyle(
                                color: Color(0xFF391713),
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.r),
                          child: Divider(color: Color(0xFFFFD8C7)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                color: Color(0xFF391713),
                                fontSize: 22.sp,
                              ),
                            ),
                            Text(
                              '\$${(data.getSubTotal() + 5.00).toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Color(0xFF391713),
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.r),
                  child: FilledButton(
                    onPressed: () {
                      context.read<CartState>().emptyCart();
                      context.go('/confirm_success');
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFFFFDECF),
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "Place Order",
                      style: TextStyle(
                        color: Color(0xFFE95322),
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
