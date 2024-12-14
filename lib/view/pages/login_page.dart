import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rgc_test_apk/controller/auth_controller.dart';
import 'package:rgc_test_apk/core/constants/app_strings.dart';
import 'package:rgc_test_apk/core/theme/color_pallets.dart';
import 'package:rgc_test_apk/view/widgets/text_field_widget.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  // Text editing controller for email field
  final mailController = TextEditingController(text: 'must@test.com');
  // Password
  final passController = TextEditingController(text: 'password');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          //
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 24,
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.logIn,
              style: TextStyle(
                  fontSize: 28,
                  color: ColorPallets.blackColor,
                  fontWeight: FontWeight.w200),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 49, bottom: 8),
              child: TextFieldWidget(
                textController: mailController,
              ),
            ),
            TextFieldWidget(
              textController: passController,
              obSecure: true,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.forgetPass,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                ),
              ),
            ),
            InkWell(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: ColorPallets.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 17),
                  child: Text(
                    AppStrings.logIn,
                    style: TextStyle(
                        color: ColorPallets.white500,
                        fontSize: 18,
                        fontWeight: FontWeight.w200),
                  ),
                )),
              ),
              onTap: () {
                /// pass user email and password
                /// verify mail and password then navigate to home page
                ref.read(verifyUserIsValidProvider(
                    mail: mailController.text,
                    pass: passController.text,
                    context: context));
              },
            )
          ],
        ),
      ),
    );
  }
}
