import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class ThemeProvider {
  final StreamingSharedPreferences preferences;

  const ThemeProvider(this.preferences);

  Stream<String> getTheme() {
    return preferences.getString("theme", defaultValue: "light");
  }

  Future<bool> setTheme(String theme) async {
    return await preferences.setString("theme", theme);
  }
}
