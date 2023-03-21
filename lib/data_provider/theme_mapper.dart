
import '../entity/theme.dart';

class RawToThemeMapper {
  static Theme toTheme(String value) {
    return Theme.values.byName(value);
  }
}
