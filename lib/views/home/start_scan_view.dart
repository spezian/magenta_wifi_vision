import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magenta_wifi_vision/views/scan_prm_screen.dart';
import 'package:magenta_wifi_vision/views/scan_roomplan_screen.dart';
import 'dart:io' show Platform;

import 'package:roomplan_flutter/api/room_plan_scanner.dart';

import '../../widgets/magenta_buttons.dart';

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
            FilledButton(
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
                      return AlertDialog(
                        title: Text("Which tech?", textAlign: .center,),
                        actions: [
                          Row(
                            spacing: 8.0,
                            children: [
                              Expanded(
                                child: MagentaSmallButton(
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
                              ),
                              Expanded(
                                child: MagentaSmallButton(
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
                              ),
                            ],
                          )
                        ],
                      );
                    }
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Text(
                    "Start Scan",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal)
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
