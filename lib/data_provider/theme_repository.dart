import 'package:flutter_todo_list/data_provider/preference/ThemeProvider.dart';
import 'package:flutter_todo_list/foundation/utils/theme_parser.dart';

import '../entity/theme.dart';

class ThemeRepository {
  final ThemeProvider _themeProvider;

  const ThemeRepository(this._themeProvider);

  Stream<Theme> getTheme() {
    return _themeProvider.getTheme().map((event) => toTheme(event));
  }

  Future<bool> setTheme(Theme theme) async {
    return _themeProvider.setTheme(theme.name);
  }
}
