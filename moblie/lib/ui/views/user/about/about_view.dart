// ignore_for_file: unused_field

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:internship/generated/l10n.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/stateful/drawer/customer_drawer_menu.dart';
import 'about_sadeemtech_view.dart';
import 'about_view_model.dart';

@RoutePage()
class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final _log = Logger('AboutView');

  _AboutViewState();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutModel>.reactive(
      viewModelBuilder: () => AboutModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => DefaultTabController(
        length: 1,
        child: Scaffold(
            backgroundColor: Theme.of(context).cardColor,
            drawer: Drawer(
                child: CustomerDrawerMenu(
              selectedDestination: 3,
            )),
            appBar: AppBar(
              backgroundColor: Theme.of(context).cardColor,
              iconTheme: IconThemeData(color: Colors.grey[700]),
              centerTitle: true,
              elevation: 1,
              bottom: TabBar(
                labelColor: Theme.of(context).primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Theme.of(context).primaryColor,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 50),
                isScrollable: false,
                tabs: <Widget>[
                  Tab(text: AppLocalizations.of(context).about_app),
                ],
              ),
            ),
            body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                TabBarView(
                  children: <Widget>[AboutSadeemTech()],
                ),
              ],
            )),
      ),
    );
  }
}
