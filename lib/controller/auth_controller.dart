import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rgc_test_apk/core/utils/snakbar.dart';
import 'package:rgc_test_apk/model/auth_model/auth_model.dart';
import 'package:rgc_test_apk/services/auth_service.dart';
import 'package:rgc_test_apk/view/pages/home_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
Future<AuthModel?> verifyUserIsValid(ref,
    {required String mail,
    required String pass,
    required BuildContext context}) async {
  final userModel = await AuthService().checkUserIsValid(mail, pass);
  if (userModel != null) {
    SnackbarUtils.showSnakBar('Login Successful');
    log(userModel.message);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }
  return null;
}
