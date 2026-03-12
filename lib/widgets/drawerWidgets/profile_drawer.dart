import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/layouts/drawer_layout.dart';
import 'package:go_router/go_router.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => ProfileDrawerState();
}

class ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return DrawerLayout(
      content: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.r,
          children: [
            Text(
              "No logged in",
              style: TextStyle(
                fontSize: 28.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Color(0xFFFFDECF),
                shape: StadiumBorder(),
              ),
              onPressed: () {
                Navigator.pop(context);
                context.go('/login');
              },
              child: Text(
                "Login",
                style: TextStyle(color: Color(0xFFE95322), fontSize: 24.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
