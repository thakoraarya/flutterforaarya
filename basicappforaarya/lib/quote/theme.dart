import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282411062),
      surfaceTint: Color(4282411062),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4290834352),
      onPrimaryContainer: Color(4278198784),
      secondary: Color(4283720525),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292339917),
      onSecondaryContainer: Color(4279377678),
      tertiary: Color(4285684748),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294959238),
      onTertiaryContainer: Color(4280490752),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294507505),
      onBackground: Color(4279835927),
      surface: Color(4294507505),
      onSurface: Color(4279835927),
      surfaceVariant: Color(4292863191),
      onSurfaceVariant: Color(4282599487),
      outline: Color(4285757806),
      outlineVariant: Color(4291020988),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217579),
      inverseOnSurface: Color(4293915368),
      inversePrimary: Color(4289057686),
      primaryFixed: Color(4290834352),
      onPrimaryFixed: Color(4278198784),
      primaryFixedDim: Color(4289057686),
      onPrimaryFixedVariant: Color(4280832032),
      secondaryFixed: Color(4292339917),
      onSecondaryFixed: Color(4279377678),
      secondaryFixedDim: Color(4290497458),
      onSecondaryFixedVariant: Color(4282141495),
      tertiaryFixed: Color(4294959238),
      onTertiaryFixed: Color(4280490752),
      tertiaryFixedDim: Color(4292985965),
      onTertiaryFixedVariant: Color(4283909376),
      surfaceDim: Color(4292402130),
      surfaceBright: Color(4294507505),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112747),
      surfaceContainer: Color(4293717989),
      surfaceContainerHigh: Color(4293323232),
      surfaceContainerHighest: Color(4292994266),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280568605),
      surfaceTint: Color(4282411062),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283793226),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281878323),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285167971),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283580672),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287263268),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294507505),
      onBackground: Color(4279835927),
      surface: Color(4294507505),
      onSurface: Color(4279835927),
      surfaceVariant: Color(4292863191),
      onSurfaceVariant: Color(4282336571),
      outline: Color(4284178775),
      outlineVariant: Color(4286020978),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217579),
      inverseOnSurface: Color(4293915368),
      inversePrimary: Color(4289057686),
      primaryFixed: Color(4283793226),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282213940),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285167971),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283523147),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287263268),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285487625),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292402130),
      surfaceBright: Color(4294507505),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112747),
      surfaceContainer: Color(4293717989),
      surfaceContainerHigh: Color(4293323232),
      surfaceContainerHighest: Color(4292994266),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278266113),
      surfaceTint: Color(4282411062),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280568605),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279772692),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281878323),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281016576),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283580672),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294507505),
      onBackground: Color(4279835927),
      surface: Color(4294507505),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292863191),
      onSurfaceVariant: Color(4280296733),
      outline: Color(4282336571),
      outlineVariant: Color(4282336571),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217579),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4291492281),
      primaryFixed: Color(4280568605),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279055368),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281878323),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280496158),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283580672),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281871104),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292402130),
      surfaceBright: Color(4294507505),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112747),
      surfaceContainer: Color(4293717989),
      surfaceContainerHigh: Color(4293323232),
      surfaceContainerHighest: Color(4292994266),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289057686),
      surfaceTint: Color(4289057686),
      onPrimary: Color(4279318539),
      primaryContainer: Color(4280832032),
      onPrimaryContainer: Color(4290834352),
      secondary: Color(4290497458),
      onSecondary: Color(4280693794),
      secondaryContainer: Color(4282141495),
      onSecondaryContainer: Color(4292339917),
      tertiary: Color(4292985965),
      onTertiary: Color(4282134272),
      tertiaryContainer: Color(4283909376),
      onTertiaryContainer: Color(4294959238),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279309327),
      onBackground: Color(4292994266),
      surface: Color(4279309327),
      onSurface: Color(4292994266),
      surfaceVariant: Color(4282599487),
      onSurfaceVariant: Color(4291020988),
      outline: Color(4287468423),
      outlineVariant: Color(4282599487),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292994266),
      inverseOnSurface: Color(4281217579),
      inversePrimary: Color(4282411062),
      primaryFixed: Color(4290834352),
      onPrimaryFixed: Color(4278198784),
      primaryFixedDim: Color(4289057686),
      onPrimaryFixedVariant: Color(4280832032),
      secondaryFixed: Color(4292339917),
      onSecondaryFixed: Color(4279377678),
      secondaryFixedDim: Color(4290497458),
      onSecondaryFixedVariant: Color(4282141495),
      tertiaryFixed: Color(4294959238),
      onTertiaryFixed: Color(4280490752),
      tertiaryFixedDim: Color(4292985965),
      onTertiaryFixedVariant: Color(4283909376),
      surfaceDim: Color(4279309327),
      surfaceBright: Color(4281743924),
      surfaceContainerLowest: Color(4278914826),
      surfaceContainerLow: Color(4279835927),
      surfaceContainer: Color(4280099099),
      surfaceContainerHigh: Color(4280757029),
      surfaceContainerHighest: Color(4281480751),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289320858),
      surfaceTint: Color(4289057686),
      onPrimary: Color(4278197248),
      primaryContainer: Color(4285635684),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290760886),
      onSecondary: Color(4279048457),
      secondaryContainer: Color(4287010174),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293314673),
      onTertiary: Color(4280096000),
      tertiaryContainer: Color(4289236541),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279309327),
      onBackground: Color(4292994266),
      surface: Color(4279309327),
      onSurface: Color(4294573298),
      surfaceVariant: Color(4282599487),
      onSurfaceVariant: Color(4291284416),
      outline: Color(4288652697),
      outlineVariant: Color(4286547322),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292994266),
      inverseOnSurface: Color(4280757029),
      inversePrimary: Color(4280897825),
      primaryFixed: Color(4290834352),
      onPrimaryFixed: Color(4278195712),
      primaryFixedDim: Color(4289057686),
      onPrimaryFixedVariant: Color(4279713297),
      secondaryFixed: Color(4292339917),
      onSecondaryFixed: Color(4278719493),
      secondaryFixedDim: Color(4290497458),
      onSecondaryFixedVariant: Color(4281088551),
      tertiaryFixed: Color(4294959238),
      onTertiaryFixed: Color(4279701504),
      tertiaryFixedDim: Color(4292985965),
      onTertiaryFixedVariant: Color(4282594560),
      surfaceDim: Color(4279309327),
      surfaceBright: Color(4281743924),
      surfaceContainerLowest: Color(4278914826),
      surfaceContainerLow: Color(4279835927),
      surfaceContainer: Color(4280099099),
      surfaceContainerHigh: Color(4280757029),
      surfaceContainerHighest: Color(4281480751),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294049768),
      surfaceTint: Color(4289057686),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289320858),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294049768),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290760886),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966006),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293314673),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279309327),
      onBackground: Color(4292994266),
      surface: Color(4279309327),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282599487),
      onSurfaceVariant: Color(4294442479),
      outline: Color(4291284416),
      outlineVariant: Color(4291284416),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292994266),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278792454),
      primaryFixed: Color(4291097780),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289320858),
      onPrimaryFixedVariant: Color(4278197248),
      secondaryFixed: Color(4292603089),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290760886),
      onSecondaryFixedVariant: Color(4279048457),
      tertiaryFixed: Color(4294960540),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293314673),
      onTertiaryFixedVariant: Color(4280096000),
      surfaceDim: Color(4279309327),
      surfaceBright: Color(4281743924),
      surfaceContainerLowest: Color(4278914826),
      surfaceContainerLow: Color(4279835927),
      surfaceContainer: Color(4280099099),
      surfaceContainerHigh: Color(4280757029),
      surfaceContainerHighest: Color(4281480751),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
