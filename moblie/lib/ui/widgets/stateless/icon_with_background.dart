import 'package:flutter/material.dart';

class IconWithBackground extends StatelessWidget {
  const IconWithBackground({
    Key? key,
    required this.iconData,
    this.color,
    this.iconColor,
    this.onTap,
    this.size,
    this.radius,
  }) : super(key: key);

  final IconData iconData;
  final Color? color;
  final Color? iconColor;
  final double? size;
  final void Function()? onTap;
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: radius ?? const BorderRadius.all(Radius.circular(8.0)),
        color: color ?? Theme.of(context).scaffoldBackgroundColor,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              iconData,
              color: iconColor ?? Theme.of(context).colorScheme.onSecondary,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}
