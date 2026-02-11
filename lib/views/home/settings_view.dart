import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/views/settings/faq_screen.dart';
import 'package:magenta_wifi_vision/views/settings/wifi_screen.dart';

import '../../widgets/magenta_label.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _bluetoothMode = false;

  @override
  void initState() {
    _bluetoothMode = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          MagentaLabel("General"),
          SwitchListTile(
            title: Text("Bluetooth Mode"),
              value: _bluetoothMode,
              onChanged: (bool? value) {
                setState(() {
                  _bluetoothMode = value!;
                });
              }
          ),
          ListTile(
            title: Text("WiFi Settings"),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const WifiSettingsScreen(),
                )
            ),
          ),
          MagentaLabel("Information"),
          ListTile(
            title: Text("FAQ"),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FaqSettingsScreen(),
                )
            ),
          ),
          ListTile(
            title: Text("Restart Tutorial"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
