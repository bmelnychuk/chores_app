import 'package:flutter/material.dart';

class BorderedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final void Function() onTap;

  const BorderedCard({
    this.onTap,
    @required this.child,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: this.padding,
        decoration: BoxDecoration(
          border: Border.all(width: 0.25),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: child,
      ),
    );
  }
}
