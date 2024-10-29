import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListItemRowsContainer extends StatelessWidget {
  List<Widget> children = <Widget>[];
  Axis? axis;

  ListItemRowsContainer({required this.children, this.axis});

  @override
  Widget build(BuildContext context) => children.isNotEmpty
      ? Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            child: Wrap(
              children: children,
            ),
          ),
        )
      : Container();
}
