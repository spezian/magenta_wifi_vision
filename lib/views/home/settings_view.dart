import 'package:flutter/material.dart';

import '../../theme.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _bluetoothMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          Text(
            "General",
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: magentaColour),
          ),
          SizedBox(
            height: 48.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const .only(
                  left: 16.0,
                  right: 8.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bluetooth Mode",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Switch(
                        value: _bluetoothMode,
                        onChanged: (bool? value) {
                          setState(() {
                            _bluetoothMode = value!;
                          });
                        }
                    )
                  ]
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const .only(
                  left: 16.0,
                  right: 8.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "WiFi Settings",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Icon(Icons.chevron_right)
                    ]
                ),
              ),
            ),
          ),
          Text(
            "Information",
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: magentaColour),
          ),
          SizedBox(
            height: 48.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const .only(
                  left: 16.0,
                  right: 8.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "FAQ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Icon(Icons.chevron_right)
                    ]
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const .only(
                  left: 16.0,
                  right: 8.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Restart Tutorial",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
