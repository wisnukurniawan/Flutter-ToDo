
import '../entity/theme.dart';

class ThemeMapper {
  static Theme toTheme(String value) {
    return Theme.values.byName(value);
  }
}
