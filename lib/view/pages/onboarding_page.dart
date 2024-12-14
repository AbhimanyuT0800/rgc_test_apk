import 'package:flutter/material.dart';
import 'package:rgc_test_apk/core/constants/app_strings.dart';
import 'package:rgc_test_apk/core/theme/color_pallets.dart';
import 'package:rgc_test_apk/view/pages/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: AppStrings.appTitle,
                style: TextStyle(
                  color: ColorPallets.primaryColor,
                  fontSize: 48,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: AppStrings.appTitle2,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w500,
                  color: ColorPallets.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
