import 'package:flutter/material.dart';

const magentaColour = Color.fromRGBO(226, 0, 116, 1);

ThemeData getMagentaTheme(BuildContext context) {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: magentaColour),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(magentaColour),
          )
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle:  WidgetStateProperty.resolveWith<TextStyle?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return Theme.of(context).textTheme.labelMedium!.copyWith(color: magentaColour);
              }

              return null;
            }
        ),
      ),
      appBarTheme: AppBarThemeData(
        titleTextStyle: TextStyle(
          color: magentaColour,
          fontSize: 36.0,
        ),
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
      fillColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return magentaColour;
            }

            return Colors.white;
          }
      )
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return magentaColour;
            }

            return Colors.white;
          }
      ),
      thumbColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }

            return Colors.black;
          }
      ),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.transparent;
            }

            return Colors.black;
          }
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      contentPadding: .only(left: 16.0, right: 8.0),
      visualDensity: VisualDensity.compact
    ),
  );
}