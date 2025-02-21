import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopease/app/shopease_app.dart';
import 'package:shopease/utils/app_colors.dart';
import 'package:shopease/utils/enums.dart';

import '../core/configurations/app_config.dart';
import '../core/service/dependency_injection.dart' as di;
import 'flavor_config.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  FlavorConfig(
      flavor: Flavor.DEV, color: Colors.black38, flavorValues: FlavorValues());

  WidgetsFlutterBinding.ensureInitialized();

  if (AppConfig.deviceOS == DeviceOS.ANDROID) {
    await Firebase.initializeApp();
    try {
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    } catch (e) {
      log('Firebase : ${e.toString()}');
    }
  } else {}

  await di.setupLocator();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.initColors().buttonColor,
  ));

  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) {
        return ShopEase();
      },
    ),
  );
}
