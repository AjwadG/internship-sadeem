import 'package:flutter/material.dart';
import 'package:internship/generated/l10n.dart';

import '/core/services/navigation/navigation_service.dart';
import '../../../locator.dart';
import '../../router.gr.dart';

class notAuthorizedIndicator extends StatelessWidget {
  const notAuthorizedIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[300]),
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                '', //
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                AppLocalizations.of(context)
                    .not_authorized_indicator_you_need_to_login_to_see_this_page,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await locator<NavigationService>()
                        .pushReplacementNamed(LoginViewRoute());
                  },
                  child: Container(
                      height: 45,
                      child: Center(
                          child: Text(
                        AppLocalizations.of(context)
                            .not_authorized_indicator_login_register,
                        style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ))),
                ),
              )
            ],
          ),
        ),
      );
}
