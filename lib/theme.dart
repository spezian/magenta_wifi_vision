import 'package:flutter/material.dart';

final magentaColour = Color.fromRGBO(226, 0, 116, 1);

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
      )
  );
}