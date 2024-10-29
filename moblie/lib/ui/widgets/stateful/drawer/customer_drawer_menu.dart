import 'package:flutter/material.dart';
import 'package:internship/core/constant/constants.dart';
import 'package:internship/core/services/key_storage/key_storage_service.dart';
import 'package:internship/core/services/permissions/permissions_service.dart';
import 'package:internship/ui/shared/ui_helper.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/asset_images.dart';
import '../../../../generated/l10n.dart';
import '../../../../locator.dart';
import '../drawer_listtile.dart';
import 'customer_drawer_menu_view_model.dart';

class CustomerDrawerMenu extends StatefulWidget {
  static final int TAB_PROFILE = 2;
  final int? selectedDestination;

  const CustomerDrawerMenu({
    this.selectedDestination,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomerDrawerMenu> createState() => _CustomerDrawerMenuState();
}

class _CustomerDrawerMenuState extends State<CustomerDrawerMenu> {
  var _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerDrawerMenuViewModel>.reactive(
      viewModelBuilder: () => CustomerDrawerMenuViewModel(),
      onModelReady: (model) {
        if (widget.selectedDestination != null) {
          _selectedDestination = widget.selectedDestination!;
        }

        return model.init();
      },
      builder: (context, model, child) => Container(
        color: Theme.of(context).colorScheme.background,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UIHelper.verticalSpaceExtraLarge(),
            UIHelper.verticalSpaceExtraLarge(),
            Column(
              children: [
                InkWell(
                  onHover: (value) {},
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: DrawerListTile(
                      navigateTo: () {
                        model.showCustomerMain(context);
                      },
                      title: AppLocalizations.of(context).main_view_home,
                    ),
                  ),
                ),
                DrawerListTile(
                  navigateTo: () {
                    model.moveToAbout(context);
                  },
                  title: AppLocalizations.of(context).account_about_app,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    height: 1,
                    thickness: 2,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                if (locator<PermissionsService>().isLoggedIn)
                  DrawerListTile(
                    navigateTo: () {
                      model.signOut(context);
                    },
                    title: AppLocalizations.of(context).sign_out,
                  ),
                if (!locator<PermissionsService>().isLoggedIn)
                  DrawerListTile(
                    navigateTo: () {
                      model.moveToLogin(context);
                    },
                    title: AppLocalizations.of(context).sign_in,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
