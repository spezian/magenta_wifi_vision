import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/widgets/magenta_outline_input_border.dart';

const magentaColour = Color.fromRGBO(226, 0, 116, 1);
const standardColor = Colors.black;
const greyColor = Colors.black12;

ThemeData getMagentaTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: magentaColour),
    textTheme: Typography.blackMountainView.copyWith(
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
        color: standardColor,
        fontFamily: 'ABeeZee',
      ),
      titleMedium: TextStyle(
        color: standardColor,
        fontFamily: 'ABeeZee',
      ),
      titleSmall: TextStyle(
        color: standardColor,
        fontFamily: 'ABeeZee',
      ),
      bodyLarge: TextStyle(
        color: standardColor,
        fontFamily: 'ABeeZee',
      ),
      bodyMedium: TextStyle(
        color: standardColor,
        fontFamily: 'ABeeZee',
      ),
      bodySmall: TextStyle(
        color: standardColor,
        fontFamily: 'ABeeZee',
      ),
      labelLarge: TextStyle(
        color: standardColor,
        fontFamily: 'ABeeZee',
      ),
      labelMedium: TextStyle(
        color: standardColor,
        fontFamily: 'ABeeZee',
      ),
      labelSmall: TextStyle(
        color: standardColor,
        fontFamily: 'ABeeZee'
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(magentaColour),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: magentaColour);
        }

        return null;
      }),
    ),
    appBarTheme: AppBarThemeData(
      titleTextStyle: TextStyle(color: magentaColour, fontSize: 36.0),
      centerTitle: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: magentaColour,
      foregroundColor: Colors.white,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(color: Colors.black, width: 2.0),
      ),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return magentaColour;
        }

        return Colors.white;
      }),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return magentaColour;
        }

        return Colors.white;
      }),
      thumbColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }

        return Colors.black;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return Colors.transparent;
        }

        return Colors.black;
      }),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      contentPadding: .only(left: 16.0, right: 8.0),
      visualDensity: VisualDensity.compact,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      enabledBorder: MagentaOutlineInputBorder(
        borderRadius: .circular(16.0),
        borderSide: BorderSide(color: Colors.black, width: 1.0),
      ),
      focusedBorder: MagentaOutlineInputBorder(
        borderRadius: .circular(16.0),
        borderSide: BorderSide(color: magentaColour, width: 1.0),
      ),
      errorBorder: MagentaOutlineInputBorder(
        borderRadius: .circular(16.0),
        borderSide: BorderSide(color: Colors.red[900]!, width: 2.0),
      ),
      focusedErrorBorder: MagentaOutlineInputBorder(
        borderRadius: .circular(16.0),
        borderSide: BorderSide(color: Colors.red, width: 2.0),
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.focused) && states.contains(WidgetState.error)) {
          return TextStyle(color: Colors.red);
        }

        if (states.contains(WidgetState.focused)) {
          return TextStyle(color: magentaColour);
        }

        if (states.contains(WidgetState.error)) {
          return TextStyle(color: Colors.red[900]);
        }

        return TextStyle(color: Colors.grey[800]);
      }),
      hintStyle: TextStyle(color: Colors.grey[800]),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: Colors.white,
      filled: true,
    ),
  );
}
