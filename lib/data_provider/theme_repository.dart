import 'package:flutter_todo_list/data_provider/preference/theme_provider.dart';
import 'package:flutter_todo_list/data_provider/utils/theme_parser.dart';

import '../entity/theme.dart';

class ThemeRepository {
  const ThemeRepository(this._themeProvider);

  final ThemeProvider _themeProvider;

  Stream<Theme> getTheme() {
    return _themeProvider.getTheme().map((event) => toTheme(event));
  }

  Future<bool> setTheme(Theme theme) async {
    return _themeProvider.setTheme(theme.name);
  }
}
