import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/widgets/magenta_app_bar.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
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
