import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/widgets/magenta_app_bar.dart';
import 'package:magenta_wifi_vision/widgets/magenta_filled_button.dart';

import '../../theme.dart';

class WifiSettingsScreen extends StatefulWidget {
  const WifiSettingsScreen({super.key});

  @override
  State<WifiSettingsScreen> createState() => _WifiSettingsScreenState();
}

class _WifiSettingsScreenState extends State<WifiSettingsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MagentaAppBar(title: Text("WiFi Settings")),
      body: Padding(
        padding: const .symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.0,
          children: [
            Text(
              "Credentials",
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: magentaColour),
            ),
            DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0)
                ),
              child: Padding(
                padding: const .symmetric(horizontal: 8.0, vertical: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 4.0,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'SSID - Placeholder',
                            labelText: 'WiFi - SSID'
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some Text";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: '*****************',
                            labelText: 'WiFi - Password',
                        ),
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a Password";
                          }
                          return null;
                        },
                      ),
                      MagentaFilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                          }
                        },
                        border: true,
                        child: Text("Save"),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
