import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Carousel extends StatefulWidget {
  List<Widget> widgets = [];
  Carousel({super.key, required this.widgets});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();
  Timer? _timer;
  int _currentIndex = 0;
  int get _totalItems => widget.widgets.length;

  @override
  void initState() {
    super.initState();
    // _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    //   _currentIndex = (_currentIndex + 1) % _totalItems;

    //   _controller.animateToItem(
    //     _currentIndex,
    //     curve: Curves.easeInOut,
    //     duration: Duration(milliseconds: 800),
    //   );
    // });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 150.h),
      child: CarouselView(
        controller: _controller,
        itemExtent: (MediaQuery.of(context).size.width - 30),
        shrinkExtent: 0,
        padding: EdgeInsets.zero,
        children: [...widget.widgets],
      ),
    );
  }
}
