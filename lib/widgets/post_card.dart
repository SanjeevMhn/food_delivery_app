import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8.0,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    CircleAvatar(radius: 25, backgroundColor: Colors.grey[300]),
                    Text(
                      "user_name12",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz, color: Colors.black),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1 / 1.15,
            child: Container(width: double.infinity, color: Colors.grey[300]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Row(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Icon(Icons.thumb_up), Text("120")],
                    ),
                    Row(
                      spacing: 4,
                      children: [Icon(Icons.comment), Text("10")],
                    ),
                    Icon(Icons.send),
                  ],
                ),
                Icon(Icons.bookmark_outline),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
