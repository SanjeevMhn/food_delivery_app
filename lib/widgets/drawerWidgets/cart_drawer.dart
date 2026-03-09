import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/layouts/drawer_layout.dart';
import 'package:food_delivery/models/cart_item_model.dart';
import 'package:food_delivery/state/cart_state.dart';
import 'package:provider/provider.dart';

class CartDrawer extends StatefulWidget {
  const CartDrawer({super.key});

  @override
  State<CartDrawer> createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  @override
  Widget build(BuildContext context) {
    List<CartItemModel> cartData = context.read<CartState>().getCart;

    return DrawerLayout(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
      emptyText: cartData.isEmpty
          ? "Your cart is empty"
          : "Your cart has ${cartData.length} item${cartData.length > 1 ? 's' : ''}",
      content: cartData.isNotEmpty ? cartList(cartData) : null,
    );
  }
}

Widget cartList(List<CartItemModel> cart) {
  return ListView.separated(
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
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: AssetImage(cart[index].image),
                fit: .cover,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              spacing: 2.r,
              crossAxisAlignment: .start,
              children: [
                Text(
                  cart[index].name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
              ],
            ),
          ),
          Spacer(flex: 1),
        ],
      );
    },
  );
}
