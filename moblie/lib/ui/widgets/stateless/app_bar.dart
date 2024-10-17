import 'package:flutter/material.dart';

// ignore: unused_import
import '/core/constant/constants.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  int toolbarExtraHeight;
  PreferredSizeWidget? bottom;

  MyAppBar({
    required this.toolbarExtraHeight,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        fill: 1.0,
        color: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: bottom,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight((58 + toolbarExtraHeight).toDouble());
}
