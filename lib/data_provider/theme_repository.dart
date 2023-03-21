import 'package:flutter_todo_list/data_provider/preference/theme_provider.dart';
import 'package:flutter_todo_list/data_provider/theme_mapper.dart';

import '../entity/theme.dart';

class ThemeRepository {
  const ThemeRepository(this._themeProvider);

  final ThemeProvider _themeProvider;

  Stream<Theme> getTheme() {
    return _themeProvider.getTheme().map(RawToThemeMapper.toTheme);
  }

  Future<bool> setTheme(Theme theme) async {
    return _themeProvider.setTheme(theme.name);
  }
}
