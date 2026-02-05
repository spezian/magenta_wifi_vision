import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/theme.dart';
import 'package:magenta_wifi_vision/views/home/history_view.dart';
import 'package:magenta_wifi_vision/views/home/scan_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [ScanView(), HistoryView(), SizedBox.shrink()][selectedViewIndex],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              selectedViewIndex = index;
            });
          },
          indicatorColor: magentaColour,
          selectedIndex: selectedViewIndex,
          destinations: const <Widget>[
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home, color: Colors.white,),
                label: "Home"
            ),
            NavigationDestination(
                icon: Icon(Icons.history_outlined),
                selectedIcon: Icon(Icons.history, color: Colors.white,),
                label: "History"
            ),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings, color: Colors.white,),
                label: "Settings"
            )
          ]
      ),
    );
  }
}
