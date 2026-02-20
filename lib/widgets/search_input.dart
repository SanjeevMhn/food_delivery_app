import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextField(
            style: TextStyle(fontSize: 12.r),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.only(
                left: 12.r,
                right: 40.r,
                top: 8.r,
                bottom: 8.r,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide.none,
              ),
              hintText: "Search",
              hintStyle: TextStyle(
                color: Color.fromRGBO(103, 103, 103, 1),
                fontSize: 12,
              ),
            ),
          ),

          Positioned(
            right: -10.r,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Color.fromRGBO(233, 83, 34, 1),
              ),
              child: Center(
                child: Icon(Icons.tune_outlined, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
