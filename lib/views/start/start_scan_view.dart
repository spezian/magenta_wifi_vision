import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magenta_wifi_vision/views/intro_screen.dart';
import 'package:magenta_wifi_vision/views/scan_screen.dart';
import 'package:magenta_wifi_vision/widgets/dialog.dart';
import 'package:magenta_wifi_vision/widgets/pill_button.dart';

import '../../widgets/filled_button.dart';

class StartScanView extends StatefulWidget {
  const StartScanView({super.key});

  @override
  State<StartScanView> createState() => _StartScanViewState();
}

class _StartScanViewState extends State<StartScanView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.wifi_rounded, size: 100.0),
            SvgPicture.asset(
              "assets/Deutsche_Telekom_2022.svg",
              width: 160.0,
              height: 160.0,
            ),
            Column(
              spacing: 8.0,
              children: [
                MagentaPillButton.large(
                  onPressed: () async {
                    if (!mounted) return;

                    showDialog(
                      context: context,
                      builder: (context) {
                        return MagentaDialog(
                          title: Text("Which tech?"),
                          showBackChevron: true,
                          actions: [
                            MagentaFilledButton(
                              onPressed: () {
                                Navigator.of(context).maybePop();



                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MagentaDialog(
                                            title: Text("Info"),
                                            content: Text("Für Apple gibt es eine eigene native Kartenscan-Technologie. Da wir uns im Web befinden, können wir sie leider nicht testen."),
                                            actions: [
                                              MagentaFilledButton(
                                                onPressed: () {
                                                  Navigator.of(context).maybePop();
                                                },
                                                child: Text("Zurück"),
                                              )
                                            ],
                                          )
                                  ),
                                );
                              },
                              child: Text("Roomplan"),
                            ),
                            MagentaFilledButton(
                              onPressed: () async {
                                try {
                                  final cameras = await availableCameras();
                                  CameraDescription camera = cameras.first;

                                  for (final c in cameras) {
                                    if (c.lensDirection == .back) {
                                      camera = c;
                                    }
                                  }

                                  if (!context.mounted) return;
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => ScanScreen(camera: camera,),
                                    ),
                                  );
                                } on CameraException {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => MagentaDialog(
                                          title: Text("Keine Kamera verfügbar"),
                                          content: Text("Bitte benutze ein Gerät mit einer Kamera auf der Rückseite."),
                                          actions: [
                                            MagentaFilledButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Zurück"),
                                            )
                                          ],
                                        )
                                    )
                                  );
                                }
                              },
                              color: .black,
                              child: Text("PRM"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Start Scan"),
                ),
                MagentaPillButton.small(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => IntroductionScreen(),
                      ),
                    );
                  },
                  child: Text("Zurück"),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
