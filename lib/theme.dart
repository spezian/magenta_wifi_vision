import 'package:flutter/material.dart';

const magentaColour = Color.fromRGBO(226, 0, 116, 1);
const foregroundColor = Colors.black;
const backgroundColor = Colors.white;
const greyColor = Colors.black12;

final magentaTextTheme = Typography.blackMountainView.copyWith(
  headlineLarge: TextStyle(
    color: magentaColour,
    fontFamily: 'Inter',
    fontSize: 36.0,
  ),
  headlineMedium: TextStyle(
    color: magentaColour,
    fontFamily: 'Inter',
  ),
  headlineSmall: TextStyle(
    color: magentaColour,
    fontFamily: 'Inter',
  ),
  titleLarge: TextStyle(
    color: foregroundColor,
    fontFamily: 'ABeeZee',
  ),
  titleMedium: TextStyle(
    color: foregroundColor,
    fontFamily: 'ABeeZee',
  ),
  titleSmall: TextStyle(
    color: foregroundColor,
    fontFamily: 'ABeeZee',
  ),
  bodyLarge: TextStyle(
    color: foregroundColor,
    fontFamily: 'ABeeZee',
  ),
  bodyMedium: TextStyle(
    color: foregroundColor,
    fontFamily: 'ABeeZee',
  ),
  bodySmall: TextStyle(
    color: foregroundColor,
    fontFamily: 'ABeeZee',
  ),
  labelLarge: TextStyle(
    color: foregroundColor,
    fontFamily: 'ABeeZee',
  ),
  labelMedium: TextStyle(
    color: foregroundColor,
    fontFamily: 'ABeeZee',
  ),
  labelSmall: TextStyle(
      color: foregroundColor,
      fontFamily: 'ABeeZee'
  ),
);

ThemeData getMagentaTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: magentaColour),
    textTheme: magentaTextTheme,
    scaffoldBackgroundColor: backgroundColor,
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(color: magentaColour, fontSize: 12.0);
        }

        return TextStyle(color: foregroundColor, fontSize: 12.0);
      }),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: magentaColour,
      foregroundColor: backgroundColor,
      shape: CircleBorder(),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(color: foregroundColor, width: 2.0),
      ),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return magentaColour;
        }

        return backgroundColor;
      }),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return magentaColour;
        }

        return backgroundColor;
      }),
      thumbColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return backgroundColor;
        }

        return foregroundColor;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return Colors.transparent;
        }

        return foregroundColor;
      }),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: greyColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      contentPadding: .only(left: 16.0, right: 8.0),
      visualDensity: VisualDensity.compact,
    ),
  );
}
