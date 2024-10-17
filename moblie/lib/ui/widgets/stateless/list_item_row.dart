import 'package:flutter/material.dart';
import 'package:internship/ui/shared/ui_helper.dart';

// ignore: must_be_immutable
class ListItemRow extends StatelessWidget {
  ValueChanged<bool>? onClick;
  IconData? icon;
  double icon_size;
  String? title;
  Widget? widget;
  bool TrailingWidget;
  bool isDividerEnabled;

  ListItemRow(
      {this.title,
      this.icon,
      this.onClick,
      this.TrailingWidget = false,
      this.isDividerEnabled = true,
      this.icon_size = 19,
      this.widget});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClick != null
            ? () {
                onClick!(true);
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 3, left: 3),
                  child: Icon(
                    icon,
                    //color: Theme.of(context).primaryColor,
                    size: icon_size,
                  ),
                ),
                UIHelper.horizontalSpaceMedium(),
                UIHelper.horizontalSpaceMedium(),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    title!,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Spacer(),
                if (TrailingWidget && widget != null) widget!
              ]),
            ],
          ),
        ),
      );
}
