import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
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
              onPressed: () {},
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
