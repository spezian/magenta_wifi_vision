import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magenta_wifi_vision/views/scan_prm_screen.dart';

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
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ScanPRMScreen(),
                  )
              ),
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
