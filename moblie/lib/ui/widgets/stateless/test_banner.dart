import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TestBanner extends StatelessWidget {
  TestBanner();

  @override
  Widget build(BuildContext context) =>
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 50),
          child: const Banner(
            message: 'نسخة تجريبية',
            location: BannerLocation.bottomStart,
          ),
        ),
      );
}
