import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:internship/core/constant/asset_images.dart';
import 'package:stacked/stacked.dart';

import '/ui/views/startup/start_up_view_model.dart';
import '../../../core/constant/app_colors.dart';

@RoutePage()
class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) {
        return model.handleStartUpLogic(context);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [],
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
