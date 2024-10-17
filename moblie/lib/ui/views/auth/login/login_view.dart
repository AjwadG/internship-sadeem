import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:internship/core/services/navigation/navigation_service.dart';
import 'package:internship/generated/l10n.dart';
import 'package:internship/ui/router.gr.dart';
import 'package:internship/ui/shared/ui_helper.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/constant/constants.dart';
import '../../../../../locator.dart';
import '../../../widgets/stateless/app_logo.dart';
import 'login_view_model.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();

  LoginView();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  final _formKey = GlobalKey<FormState>();
  int click_count = 0;

  @override
  void initState() {
    super.initState();
    emailController =
        TextEditingController(text: !kReleaseMode ? 'sadeem@gmail.com' : '');
    passwordController =
        TextEditingController(text: !kReleaseMode ? 'password' : '');

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordController!.dispose();
    emailController!.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle _style = ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: Theme.of(context).colorScheme.primary,
      minimumSize: Size(180, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
    TextStyle _txtStyle = TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
      fontWeight: FontWeight.w300,
    );
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onViewModelReady: (model) {
        return model.init(context);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                UIHelper.verticalSpaceMedium(),
                Container(
                  child: AppLogo(
                    clipRRectcircular: 15,
                    type: Constants.LOGO_URL_TYPE,
                    height: 350.0,
                    width: 350.0,
                  ),
                ),
                Text(
                  AppLocalizations.of(context).sign_in,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    AppLocalizations.of(context).sign_in_with_email,
                  ),
                ),
                UIHelper.verticalSpaceMedium(),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 350,
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          UIHelper.verticalSpaceMedium(),
                          UIHelper.verticalSpaceMedium(),
                          Card(
                            margin: EdgeInsets.zero,
                            clipBehavior: Clip.antiAlias,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: TextFormField(
                                focusNode: emailFocusNode,
                                controller: emailController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                onChanged: (value) {},
                                validator: (value) {
                                  if (model.validateEmail(
                                          emailController!.text) !=
                                      null) {
                                    return AppLocalizations.of(context)
                                        .wrong_email;
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context).email,
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.email),
                                ),
                              ),
                            ),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Card(
                            margin: EdgeInsets.zero,
                            clipBehavior: Clip.antiAlias,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                focusNode: passwordFocusNode,
                                controller: passwordController,
                                validator: (value) {
                                  if (model.validatePassword(
                                          passwordController!.text) !=
                                      null) {
                                    return AppLocalizations.of(context)
                                        .password_must_be_more_than_6_characters_long;
                                  }
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      AppLocalizations.of(context).password,
                                  suffixIcon: Icon(Icons.lock),
                                ),
                              ),
                            ),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          UIHelper.verticalSpaceSmall(),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await model.loginWithEmail({
                                      'password': passwordController!.text,
                                      'email': emailController!.text
                                    });
                                  }
                                },
                                style: _style,
                                child: Text(
                                  AppLocalizations.of(context)
                                      .sign_in_with_email,
                                  style: _txtStyle,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  await model.moveToSignUp();
                                },
                                style: _style,
                                child: Text(
                                  AppLocalizations.of(context)
                                      .login_view_sign_up,
                                  style: _txtStyle,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                                child: Text(
                                  AppLocalizations().skip_and_continue,
                                  style: TextStyle(fontSize: 14),
                                ),
                                onTap: () async {
                                  unawaited(locator<NavigationService>()
                                      .popAllAndPushNamed(MainViewRoute()));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
