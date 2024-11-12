import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependency {
  AppDependency({
    required this.shp,
    required this.locale,
    required this.theme,
    required this.player,
  });

  bool theme;
  String locale;

  final SharedPreferences shp;

  final AudioPlayer player;
}
