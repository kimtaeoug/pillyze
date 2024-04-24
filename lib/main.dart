import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pillyze/app/config/constants.dart';
import 'package:pillyze/app/routes/pages.dart';
import 'package:pillyze/app/routes/routes.dart';
import 'package:pillyze/app/util/dependecy_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Zone.current.run(() async {
    DependencyCreator.init();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.HOME,
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!),
    );
  }
}
