import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/layouts/page_layout.dart';
import 'package:food_delivery/models/food_detail_model.dart';
import 'package:food_delivery/models/recommeded_item_model.dart';
import 'package:food_delivery/state/favorite_state.dart';
import 'package:food_delivery/widgets/recommeded_item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<FoodDetailModel> favorites = context
        .watch<FavoriteState>()
        .getFavorites;
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageLayout(
        topSection: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 25.w,
              height: 25.h,
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if(context.canPop()){
                      context.pop();
                    }else{
                      context.go('/');
                    }
                  },
                  icon: Icon(Icons.chevron_left),
                  color: Color(0xFFE95322),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Favorites",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        mainSection: Padding(
          padding: EdgeInsetsGeometry.only(
            top: 30.r,
            left: 25.r,
            right: 25.r,
            bottom: 25.r,
          ),
          child: favorites.isEmpty
              ? Center(
                  child: Text(
                    "No Favorites added.",
                    style: TextStyle(color: Color(0xFFE95322), fontSize: 18.sp),
                  ),
                )
              : Column(
                  children: [
                    Center(
                      child: Text(
                        "It's time to buy your favorite dish.",
                        style: TextStyle(
                          color: Color(0xFFE95322),
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final item = favorites[index];
                        return InkWell(
                          onTap: () {
                            context.go('/detail/${item.id}');
                          },
                          child: RecommededItem(
                            item: RecommededItemModel(
                              id: item.id,
                              image: item.image,
                              price: item.price,
                              rating: item.ratings,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
