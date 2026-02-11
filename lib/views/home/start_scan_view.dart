import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magenta_wifi_vision/views/scan/prm_screen.dart';
import 'package:magenta_wifi_vision/views/scan/roomplan_screen.dart';
import 'package:magenta_wifi_vision/widgets/magenta_dialog.dart';
import 'package:magenta_wifi_vision/widgets/magenta_pill_button.dart';
import 'dart:io' show Platform;

import 'package:roomplan_flutter/api/room_plan_scanner.dart';

import '../../widgets/magenta_filled_button.dart';

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
            Icon(
                Icons.wifi_rounded,
                size: 100.0
            ),
            SvgPicture.asset(
              "assets/Deutsche_Telekom_2022.svg",
              width: 160.0,
              height: 160.0,
            ),
            MagentaPillButton.large(
              onPressed: () async {
                if (!mounted) return;

                if (!Platform.isIOS || !(await RoomPlanScanner.isSupported())) {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ScanPRMScreen(),
                      )
                  );

                  return;
                }

                showDialog(
                    context: context,
                    builder: (context) {
                      return MagentaDialog(
                        title: Text("Which tech?"),
                        actions: [
                          MagentaFilledButton(
                            onPressed: () {
                              Navigator.of(context).maybePop();

                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ScanRoomplanScreen(),
                                  )
                              );
                            },
                            child: Text("Roomplan"),
                          ),
                          MagentaFilledButton(
                            onPressed: () {
                              Navigator.of(context).maybePop();

                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ScanPRMScreen(),
                                  )
                              );
                            },
                            color: .black,
                            child: Text("PRM"),
                          ),
                        ],
                      );
                    }
                );
              },
              child: Text("Start Scan"),
            ),
          ],
        )
      ],
    );
  }
}
