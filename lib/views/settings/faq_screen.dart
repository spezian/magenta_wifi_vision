import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/widgets/app_bar.dart';

class FaqSettingsScreen extends StatefulWidget {
  const FaqSettingsScreen({super.key});

  @override
  State<FaqSettingsScreen> createState() => _FaqSettingsScreenState();
}

class _FaqSettingsScreenState extends State<FaqSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MagentaAppBar(title: Text("FAQ")),
      body: Center(
        child: Text("was letzte rewrite?"),
      ),
    );
  }
}
