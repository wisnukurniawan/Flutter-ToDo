import 'package:flutter_todo_list/utils/locale.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class LocaleProvider {
  final StreamingSharedPreferences preferences;

  const LocaleProvider(this.preferences);

  Stream<String> getLocale() {
    return preferences.getString("locale", defaultValue: defaultLocaleCode);
  }

  Future<bool> setLocale(String localeCode) async {
    return await preferences.setString("locale", localeCode);
  }
}
