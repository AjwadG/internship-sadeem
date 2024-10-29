import 'package:flutter/material.dart';

// ignore: must_be_immutable
class inputDecoratorItem extends StatelessWidget {
  ValueChanged<bool>? onClick;
  Widget? widget;
  Widget? leadingWidget;
  String placeholder;
  Color border_color;

  inputDecoratorItem({
    this.leadingWidget,
    required this.placeholder,
    required this.border_color,
    this.widget,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClick != null
            ? () {
                onClick!(true);
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: InputDecorator(
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: leadingWidget,
              ),
              contentPadding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              labelText: placeholder,
              labelStyle: TextStyle(fontWeight: FontWeight.w800),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(width: 1, color: border_color),
              ),
            ),
            child: widget,
          ),
        ),
      );
}
