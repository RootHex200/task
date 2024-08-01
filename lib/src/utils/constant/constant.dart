

import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> shared_preferences= SharedPreferences.getInstance();

Future<String?> getToken()async{
    final SharedPreferences prefs = await shared_preferences;
    return prefs.getString("token");
}