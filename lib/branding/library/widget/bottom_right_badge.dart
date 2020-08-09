import 'package:flutter/material.dart';

class BottomRightBadge extends StatelessWidget {
  final Widget child;

  BottomRightBadge({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
