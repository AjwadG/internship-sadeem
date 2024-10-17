import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logging/logging.dart';
import 'package:internship/generated/l10n.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/asset_images.dart';
import '../../../../core/services/snackbar/snack_bar_service.dart';
import '../../../../locator.dart';
import '../../../shared/ui_helper.dart';
import '../../../widgets/stateless/loading_circular_progress_indicator.dart';
import 'about_view_model.dart';

class AboutSadeemTech extends StatefulWidget {
  const AboutSadeemTech();

  @override
  _AboutSadeemTechState createState() => _AboutSadeemTechState();
}

class _AboutSadeemTechState extends State<AboutSadeemTech> {
  final _log = Logger('AboutSadeemTech');
  int click_count = 0;

  _AboutSadeemTechState();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutModel>.reactive(
        viewModelBuilder: () => AboutModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => model.isBusy
            ? Scaffold(
                body: LoadingCircularProgressIndicator(),
              )
            : Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                        },
                        child: Center(
                          child: Container(
                            width: 220,
                            height: 250,
                            child: Image.asset(AssetImages.sadeem_logo),
                          ),
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context).account_sadeem_tech_co,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(AppLocalizations.of(context).sadeem_info,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.5,
                            )),
                      ),
                      Spacer(),
                      const SizedBox(
                        height: 5,
                      ),

                    ],
                  ),
                ),
              ));
  }
}
