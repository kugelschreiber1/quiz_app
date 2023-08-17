import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget? child;
  final List<Color> colors;
  final Alignment beginPosition;
  final Alignment endPosition;

  const GradientContainer(
      {super.key,
      required this.child,
      required this.colors,
      required this.beginPosition,
      required this.endPosition});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: beginPosition,
            end: endPosition,
          ),
        ),
        child: child,
      ),
    );
  }
}
