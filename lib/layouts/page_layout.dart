import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/state/bot_menu_state.dart';
import 'package:provider/provider.dart';

class PageLayout extends StatelessWidget {
  final Widget topSection;
  final Widget mainSection;

  const PageLayout({
    super.key,
    required this.topSection,
    required this.mainSection,
  });

  @override
  Widget build(BuildContext context) {
    final hasActiveBotMenu = context.watch<BotMenuState>().hasActiveBotMenu();
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xFFF5CB58),
              padding: EdgeInsets.only(
                top: 30.r,
                left: 25.r,
                right: 25.r,
                bottom: 25.r,
              ),
              child: topSection,
            ),
            Container(
              color: Color.fromRGBO(245, 203, 88, 1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                  color: hasActiveBotMenu
                      ? Color.fromRGBO(233, 83, 34, 1)
                      : Colors.white,
                ),
                child: mainSection,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
