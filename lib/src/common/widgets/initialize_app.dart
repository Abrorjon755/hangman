import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../dependency/dependency.dart';

class InitializeApp {
  static Future<AppDependency> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await FullScreenWindow.setFullScreen(true);

    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    // Local settings
    final shp = await SharedPreferences.getInstance();

    bool theme = shp.getBool(Constants.theme) ?? true;
    String locale = shp.getString(Constants.locale) ?? "en";

    return AppDependency(
      shp: shp,
      locale: locale,
      theme: theme,
    );
  }
}
