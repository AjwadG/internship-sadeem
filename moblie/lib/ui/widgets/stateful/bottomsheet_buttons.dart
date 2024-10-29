import 'package:flutter/material.dart';
import 'package:internship/core/constant/constants.dart';

class BottomSheetButtons extends StatefulWidget {
  final String label;
  final VoidCallback navigateTO;

  const BottomSheetButtons({
    Key? key,
    required this.label,
    required this.navigateTO,
  }) : super(key: key);

  @override
  State<BottomSheetButtons> createState() => _BottomSheetButtonsState();
}

class _BottomSheetButtonsState extends State<BottomSheetButtons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        widget.navigateTO();
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(
          2,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
        ),
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontFamily: Constants.app_font_name,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
