import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/layouts/drawer_layout.dart';
import 'package:food_delivery/models/cart_item_model.dart';
import 'package:food_delivery/state/cart_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartDrawer extends StatefulWidget {
  const CartDrawer({super.key});

  @override
  State<CartDrawer> createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  @override
  Widget build(BuildContext context) {
    List<CartItemModel> cartData = context.watch<CartState>().getCart;

    return DrawerLayout(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
      emptyText: cartData.isEmpty
          ? "Your cart is empty"
          : "Your cart has ${cartData.length} item${cartData.length > 1 ? 's' : ''}",
      content: cartData.isNotEmpty ? cartList(cartData, context) : null,
    );
  }
}

Widget cartList(List<CartItemModel> cart, BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => Column(
            children: [
              SizedBox(height: 10.h),
              Divider(color: Colors.white),
              SizedBox(height: 10.h),
            ],
          ),
          itemCount: cart.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                      image: AssetImage(cart[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    spacing: 2.r,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart[index].name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 25.w,
                      height: 25.h,
                      child: Center(
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.delete_rounded),
                          padding: EdgeInsets.zero,
                          iconSize: 16.sp,
                          onPressed: () {
                            showDialog(
                              context: context,
                              useRootNavigator: true,
                              useSafeArea: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Remove Item"),
                                  content: Text("Remove item from cart?"),
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
                                            .removeCartItem(cart[index]);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Remove'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Text(
                      '\$${cart[index].price}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.h,),
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
                                color: Color(0xFFE95322),
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white,
                                iconSize: 16.sp,
                                shape: CircleBorder(),
                              ),
                              onPressed: () {
                                context.read<CartState>().decreaseQuantity(
                                  cart[index],
                                );
                              },
                            ),
                          ),
                        ),
                        Consumer<CartState>(
                          builder: (context, data, child) {
                            return Text(
                              '${data.cart[index].quantity}',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
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
                              icon: Icon(Icons.add, color: Color(0xFFE95322)),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white,
                                iconSize: 16.sp,
                                shape: CircleBorder(),
                              ),
                              onPressed: () {
                                context.read<CartState>().increaseQuantity(
                                  cart[index],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      SizedBox(height: 10.h),
      Divider(color: Colors.white),
      SizedBox(height: 10.h),
      Consumer<CartState>(
        builder: (context, data, child) {
          return Column(
            spacing: 8.r,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  Text(
                    '\$${data.getSubTotal().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Delivery',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  Text(
                    '\$5.00',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ],
              ),
              Divider(color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  Text(
                    '\$${(data.getSubTotal() + 5.00).toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      SizedBox(height: 25.h),
      FilledButton(
        onPressed: () {
          Navigator.pop(context);
          context.go("/confirm");
        },
        style: FilledButton.styleFrom(
          backgroundColor: Color(0xFFF5CB58),
          shape: StadiumBorder(),
        ),
        child: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 20.sp,
            color: Color(0xFFE95322),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 25.h),
    ],
  );
}
