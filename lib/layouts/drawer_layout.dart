import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerLayout extends StatelessWidget {
  final IconData? icon;
  final String? title;

  final String? emptyText;
  final Widget? content;

  const DrawerLayout({
    super.key,
    this.icon,
    this.title,
    this.emptyText,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFE95322),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.r),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  if (icon != null && title != null)
                    Padding(
                      padding: EdgeInsets.only(top: 65.r, bottom: 30.r),
                      child: Row(
                        spacing: 8.r,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40.r,
                            height: 40.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(icon, color: Color(0xFFE95322)),
                            ),
                          ),
                          Text(
                            title!,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const Divider(color: Color(0xFFF5CB58)),
                  SizedBox(height: 10.h),

                  if (emptyText != null)
                    Text(
                      emptyText!,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),

            if (content != null)
              SliverFillRemaining(hasScrollBody: true, child: content),
          ],
        ),
      ),
    );
    
  }
}
