import 'package:flutter/material.dart';

class ActiveRoundedMenu extends CustomPainter {
  final Color color;
  final double radius; // Bottom inverted radius
  final double topRadius; // Top standard radius

  ActiveRoundedMenu({
    required this.color,
    this.radius = 20.0,
    this.topRadius = 25.0, // Default top rounding
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // 1. Start at the bottom-left point (on the wing)
    path.moveTo(-radius, size.height);

    // 2. LEFT INVERTED CURVE (Bottom-Left)
    // Curves from the wing up into the vertical side
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // 3. Line up the left side to the start of the top curve
    path.lineTo(0, topRadius);

    // 4. TOP-LEFT ROUNDED CORNER
    // Aim for (0,0), land at (topRadius, 0)
    path.quadraticBezierTo(0, 0, topRadius, 0);

    // 5. Draw the top edge across
    path.lineTo(size.width - topRadius, 0);

    // 6. TOP-RIGHT ROUNDED CORNER
    // Aim for (size.width, 0), land at (size.width, topRadius)
    path.quadraticBezierTo(size.width, 0, size.width, topRadius);

    // 7. Draw the right side down to where the bottom curve starts
    path.lineTo(size.width, size.height - radius);

    // 8. RIGHT INVERTED CURVE (Bottom-Right)
    // Curves from the body out to the right wing
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width + radius,
      size.height,
    );

    // 9. Close the path by drawing the bottom line connecting the wings
    path.lineTo(-radius, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant ActiveRoundedMenu oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.radius != radius ||
      oldDelegate.topRadius != topRadius;
}
