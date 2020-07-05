import 'package:flutter/material.dart';

class BorderedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const BorderedCard({
    @required this.child,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding,
      decoration: BoxDecoration(
        border: Border.all(width: 0.25),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: child,
    );
  }
}
