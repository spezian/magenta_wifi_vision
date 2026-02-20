import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magenta_wifi_vision/theme.dart';
import 'package:magenta_wifi_vision/views/start_screen.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: magentaColour,
      appBar: AppBar(
        title: Text(
            "Praktikum 2026",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
        titleTextStyle: TextStyle(color: magentaColour, fontSize: 36.0),
        backgroundColor: magentaColour,
        centerTitle: true,
      ),
      body: Padding(
        padding: .only(top: 24.0, left: 16.0, right: 16.0, bottom: 64.0),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              spacing: 16.0,
              children: [
                Column(
                  spacing: 8.0,
                  children: [
                    Row(
                      spacing: 16,
                      mainAxisAlignment: .center,
                      children: [
                        SvgPicture.asset(
                          "assets/Deutsche_Telekom_2022.svg",
                          color: Colors.white,
                          width: 40.0,
                          height: 40.0,
                        ),
                        Text(
                          "WifiAnalyzer Prototyp",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    Text(
                      "Die Website ist nur für die Größe eines Handys gedacht!",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                      textAlign: .center,
                    ),
                  ],
                ),
                Text(
                    "Hallo Herr Bouzlafa, hier können Sie den Prototypen, den ich eigentlich für Smartphones entwickelt habe, im Web austesten. Daran können Sie schon den großen Vorteil von Flutter sehen, da man ohne großen Aufwand die App überall laufen lassen kann. Wichtig ist, es ist nur ein Prototyp. Es arbeitet nur mit vorher festgelegten Daten und wirklich spannend ist es auch nicht.",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ],
            ),
            FilledButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => StartScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color?>(Colors.white),
                  foregroundColor: WidgetStatePropertyAll<Color?>(magentaColour),
                  shape:  WidgetStatePropertyAll<OutlinedBorder?>(RoundedRectangleBorder(
                    borderRadius: .zero
                  ))
                ),
                child: Text("Prototyp starten")
            )
          ],
        ),
      )
    );
  }
}
