import 'package:flutter/material.dart';
import 'package:internship/generated/l10n.dart';
import 'package:internship/ui/shared/ui_helper.dart';

/// Basic layout for indicating that an exception occurred.
class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({
    required this.title,
    required this.assetName,
    this.message,
    this.onTryAgain,
    Key? key,
    // ignore: unnecessary_null_comparison
  })  : assert(assetName != null),
        super(key: key);
  final String title;
  final String? message;
  final String assetName;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (message != null)
                const SizedBox(
                  height: 16,
                ),
              if (message != null)
                Text(
                  message!,
                  textAlign: TextAlign.center,
                ),
              if (onTryAgain != null) const Spacer(),
              if (onTryAgain != null)
                Container(
                    height: 50,
                    width: double.infinity,
                    constraints: BoxConstraints(maxWidth: 500),
                    child: ElevatedButton(
                        onPressed: onTryAgain,
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          minimumSize: Size(180, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh,
                            ),
                            UIHelper.horizontalSpaceSmall(),
                            Text(
                              AppLocalizations.of(context)
                                  .exception_indicator_try_again,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            ),
                          ],
                        ))),
            ],
          ),
        ),
      );
}
