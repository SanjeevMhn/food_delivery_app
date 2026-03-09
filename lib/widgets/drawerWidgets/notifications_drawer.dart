import 'package:flutter/material.dart';
import 'package:food_delivery/layouts/drawer_layout.dart';

class NotificationsDrawer extends StatefulWidget {
  const NotificationsDrawer({super.key});

  @override
  State<NotificationsDrawer> createState() => _NotificationsDrawerState();
}

class _NotificationsDrawerState extends State<NotificationsDrawer> {
  @override
  Widget build(BuildContext context) {
    return DrawerLayout(
      icon: Icons.notifications_none_outlined,
      title: 'Notifications',
      emptyText: "No Notifications",
    );
  }
}
