import 'package:flutter/material.dart';
import 'package:internship/generated/l10n.dart';

class ConfirmDialog extends StatelessWidget {
  final VoidCallback onDenied;
  final VoidCallback onConfirmed;
  final String title;
  final String description;
  final String? buttonTitle;

  const ConfirmDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.onDenied,
    required this.onConfirmed,
    this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onDenied();

        return false;
      },
      child: AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          ElevatedButton(
            child: Text(AppLocalizations.of(context).general_cancel),
            onPressed: () {
              onDenied();
            },
          ),
          ElevatedButton(
            child: Text(AppLocalizations.of(context).general_confirm),
            onPressed: () {
              onDenied();
            },
          ),
        ],
      ),
    );
  }
}
