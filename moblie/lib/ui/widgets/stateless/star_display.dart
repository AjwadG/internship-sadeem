import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final int value;
  final double iconSize;
  final Color color;

  const StarDisplay(
      {Key? key, this.value = 0, this.iconSize = 25, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: color,
          size: iconSize,
        );
      }),
    );
  }
}
