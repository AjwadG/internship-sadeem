import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PopupDialog extends StatefulWidget {
  final String title;
  final bool confirmation;

  const PopupDialog({
    Key? key,
    required this.title,
    this.confirmation = true,
  }) : super(key: key);

  @override
  State<PopupDialog> createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 0.5,
        sigmaY: 0.5,
      ),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              28.0,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 12.5,
                left: 12.5,
              ),
              child: widget.confirmation
                  ? FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: 90,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : FaIcon(
                      FontAwesomeIcons.circleXmark,
                      size: 90,
                      color: Theme.of(context).colorScheme.primary,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
