import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internship/core/services/navigation/navigation_service.dart';
import 'package:internship/generated/l10n.dart';
import 'package:internship/locator.dart';
import 'package:internship/ui/router.gr.dart';
import 'package:internship/ui/views/auth/signup/signup_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:pedantic/pedantic.dart';
import 'package:internship/ui/shared/ui_helper.dart';
import '../../../../../core/constant/constants.dart';

@RoutePage()
class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
    with SingleTickerProviderStateMixin {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;
  TextEditingController? phoneController;

  late FocusNode emailFocusNode;
  late FocusNode nameFocusNode;
  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: '');
    nameController = TextEditingController(text: '');
    phoneController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
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
    var _style = ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: Theme.of(context).colorScheme.primary,
      minimumSize: Size(180, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
    var _txtStyle = TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
      fontWeight: FontWeight.w300,
    );
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      onViewModelReady: (model) {
        return model.init(context);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                UIHelper.verticalSpaceMedium(),
                Text(
                  AppLocalizations.of(context).login_view_sign_up,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIHelper.verticalSpaceMedium(),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
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
                                focusNode: nameFocusNode,
                                controller: nameController,
                                validator: (value) {
                                  if (model.validateEmptyString(
                                          nameController!.text) !=
                                      null) {
                                    return AppLocalizations.of(context)
                                        .profile_edit_view_it_can_not_be_empty;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: AppLocalizations.of(context).name,
                                  suffixIcon: Icon(Icons.person),
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
                                focusNode: phoneFocusNode,
                                controller: phoneController,
                                validator: (value) {
                                  if (model.validatePhoneNumber(
                                          phoneController!.text) !=
                                      null) {
                                    return AppLocalizations.of(context)
                                        .wrong_value;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: AppLocalizations.of(context).phone,
                                  suffixIcon: Icon(Icons.phone),
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
                          UIHelper.verticalSpaceExtraLarge(),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await model.signUp({
                                      'name': nameController!.text,
                                      'phone': phoneController!.text,
                                      'password': passwordController!.text,
                                      'email': emailController!.text
                                    });
                                  }
                                },
                                style: _style,
                                child: Text(
                                  AppLocalizations.of(context)
                                      .sign_up_view_sign,
                                  style: _txtStyle,
                                )),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                                child: Text(
                                  AppLocalizations().sign_in,
                                  style: TextStyle(fontSize: 14),
                                ),
                                onTap: () {
                                  model.moveToLogin();
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
