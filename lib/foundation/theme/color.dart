import 'package:flutter/material.dart';

const lightPrimary = Color(0xFF7F3DFF);
const lightBackgroundL1 = Color(0xFFFFFFFF);
const lightItemBackgroundL1 = Color(0xFFF7F7F7);
const lightBackgroundL2 = Color(0xFFFFFFFF);
const lightItemBackgroundL2 = Color(0xFFF1F1F1);
const lightOn = Color(0xFF000000);
const lightError = Color(0xFFEA6D7E);

const twilightPrimary = Color(0xFF319DE6);
const twilightBackgroundL1 = Color(0xFF20232F);
const twilightItemBackgroundL1 = Color(0xFF373945);
const twilightBackgroundL2 = Color(0xFF2A2D39);
const twilightItemBackgroundL2 = Color(0xFF373945);
const twilightOn = Color(0xFFFFFFFF);

const nightPrimary = Color(0xFFF2355B);
const nightBackgroundL1 = Color(0xFF000000);
const nightItemBackgroundL1 = Color(0xFF333333);
const nightBackgroundL2 = Color(0xFF242424);
const nightItemBackgroundL2 = Color(0xFF383838);
const nightOn = Color(0xFFFFFFFF);

const sunrisePrimary = Color(0xFFFE822F);
const sunriseBackgroundL1 = Color(0xFFFFFCF3);
const sunriseItemBackgroundL1 = Color(0xFFDCD3CC);
const sunriseBackgroundL2 = Color(0xFFFFFCF3);
const sunriseItemBackgroundL2 = Color(0xFFF4EFE5);
const sunriseOn = Color(0xFF4E312F);
const sunriseError = Color(0xFFD00036);

const auroraPrimary = Color(0xFF299A8B);
const auroraBackgroundL1 = Color(0xFF001B12);
const auroraItemBackgroundL1 = Color(0xFF335147);
const auroraBackgroundL2 = Color(0xFF283E37);
const auroraItemBackgroundL2 = Color(0xFF3D514A);
const auroraOn = Color(0xFFD0E0CF);

const error = Color(0xFFB00020);

const listRed = Color(0xFFFF453A);
const listOrange = Color(0xFFFF9F0A);
const listYellow = Color(0xFFFFD60A);
const listGreen = Color(0xFF30D15B);
const listBlue = Color(0xFF0A84FF);
const listPurple = Color(0xFF5E5CE6);
const listBrown = Color(0xFFC9A675);

const commonGrey = Color(0xFF5B626A);
const white = Color(0xFFFFFFFF);

const lightColorPalette = ColorScheme(
  brightness: Brightness.light,
  primary: lightPrimary,
  primaryContainer: lightPrimary,
  secondary: lightItemBackgroundL1,
  secondaryContainer: lightItemBackgroundL1,
  background: lightBackgroundL2,
  surface: lightBackgroundL1,
  surfaceVariant: lightItemBackgroundL2,
  error: lightError,
  onPrimary: white,
  onPrimaryContainer: white,
  onSecondary: lightOn,
  onSecondaryContainer: lightOn,
  onBackground: lightOn,
  onSurface: lightOn,
  onSurfaceVariant: lightOn,
  onError: white,
);

const twilightColorPalette = ColorScheme(
  brightness: Brightness.light,
  primary: twilightPrimary,
  primaryContainer: twilightPrimary,
  secondary: twilightItemBackgroundL1,
  secondaryContainer: twilightItemBackgroundL1,
  background: twilightBackgroundL2,
  surface: twilightBackgroundL1,
  surfaceVariant: twilightItemBackgroundL2,
  error: error,
  onPrimary: twilightOn,
  onPrimaryContainer: twilightOn,
  onSecondary: twilightOn,
  onSecondaryContainer: twilightOn,
  onBackground: twilightOn,
  onSurface: twilightOn,
  onSurfaceVariant: twilightOn,
  onError: white,
);

const nightColorPalette = ColorScheme(
  brightness: Brightness.dark,
  primary: nightPrimary,
  primaryContainer: nightPrimary,
  secondary: nightItemBackgroundL1,
  secondaryContainer: nightItemBackgroundL1,
  background: nightBackgroundL2,
  surface: nightBackgroundL1,
  surfaceVariant: nightItemBackgroundL2,
  error: error,
  onPrimary: nightOn,
  onPrimaryContainer: nightOn,
  onSecondary: nightOn,
  onSecondaryContainer: nightOn,
  onBackground: nightOn,
  onSurface: nightOn,
  onSurfaceVariant: nightOn,
  onError: white,
);

const sunriseColorPalette = ColorScheme(
  brightness: Brightness.dark,
  primary: sunrisePrimary,
  primaryContainer: sunrisePrimary,
  secondary: sunriseItemBackgroundL1,
  secondaryContainer: sunriseItemBackgroundL1,
  background: sunriseBackgroundL2,
  surface: sunriseBackgroundL1,
  surfaceVariant: sunriseItemBackgroundL2,
  error: sunriseError,
  onPrimary: sunriseOn,
  onPrimaryContainer: sunriseOn,
  onSecondary: sunriseOn,
  onSecondaryContainer: sunriseOn,
  onBackground: sunriseOn,
  onSurface: sunriseOn,
  onSurfaceVariant: sunriseOn,
  onError: white,
);

const auroraColorPalette = ColorScheme(
  brightness: Brightness.dark,
  primary: auroraPrimary,
  primaryContainer: auroraPrimary,
  secondary: auroraItemBackgroundL1,
  secondaryContainer: auroraItemBackgroundL1,
  background: auroraBackgroundL2,
  surface: auroraBackgroundL1,
  surfaceVariant: auroraItemBackgroundL2,
  error: error,
  onPrimary: auroraOn,
  onPrimaryContainer: auroraOn,
  onSecondary: auroraOn,
  onSecondaryContainer: auroraOn,
  onBackground: auroraOn,
  onSurface: auroraOn,
  onSurfaceVariant: auroraOn,
  onError: white,
);
