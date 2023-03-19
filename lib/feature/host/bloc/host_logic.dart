
import 'package:flutter/material.dart' hide Theme;

import '../../../entity/theme.dart';
import '../../../foundation/theme/color.dart';

ColorScheme toColorScheme(Theme theme) {
  switch(theme) {
    case Theme.light:
      return lightColorPalette;
    case Theme.twilight:
      return twilightColorPalette;
    case Theme.night:
      return nightColorPalette;
    case Theme.sunrise:
      return sunriseColorPalette;
    case Theme.aurora:
      return auroraColorPalette;
  }
}
