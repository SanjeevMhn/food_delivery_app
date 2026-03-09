import 'package:flutter/material.dart';
import 'package:food_delivery/layouts/drawer_layout.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => ProfileDrawerState();
}

class ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return DrawerLayout();
  }
}
