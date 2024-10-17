import 'package:flutter/material.dart';

class DrawerListTile extends StatefulWidget {
  final String? title;
  final VoidCallback navigateTo;

  DrawerListTile({
    required this.navigateTo,
    required this.title,
  });

  @override
  _DrawerListTileState createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext t) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      // decoration: widget.isSelectedDestination
      //     ? BoxDecoration(
      //         color: Theme.of(context).colorScheme.secondaryContainer,
      //         borderRadius: BorderRadius.all(Radius.circular(30)),
      //       )
      //     : BoxDecoration(),
      child: ListTile(
        title: Text(
          widget.title!, //
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () {
          widget.navigateTo();
        },
      ),
    );
  }
}
