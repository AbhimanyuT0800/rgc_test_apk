import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rgc_test_apk/controller/object_box_imp/object_box_imp.dart';
import 'package:rgc_test_apk/view/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await untill create object box
  // await ObjectBoxImpl.create();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  //scaffoldmessenger key for pass context
  static final scaffoldMessngerKey = GlobalKey<ScaffoldMessengerState>();
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: scaffoldMessngerKey,
        theme: ThemeData(fontFamily: 'PlusJakartaSans'),
        home: const OnboardingPage());
  }
}
