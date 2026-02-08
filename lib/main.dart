import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/theme.dart';
import 'package:magenta_wifi_vision/views/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magenta WifiVision',
      theme: getMagentaTheme(context),
      home: HomeScreen(),
    );
  }
}