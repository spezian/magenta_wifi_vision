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
  VoidCallback? _fabAction;
  int _selectedViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: [
        null,
        AppBar(
          title: Text("History"),
          centerTitle: true,
        ),
        null
      ][_selectedViewIndex],
      body: [
        ScanView(),
        HistoryView(onFabPressed: (callback) => _fabAction = callback,),
        SizedBox.shrink()
      ][_selectedViewIndex],
      floatingActionButton: [
        null,
        FloatingActionButton(
            onPressed: _fabAction,
          child: Icon(Icons.add),
        ),
        null,
      ][_selectedViewIndex],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _selectedViewIndex = index;
            });
          },
          indicatorColor: magentaColour,
          selectedIndex: _selectedViewIndex,
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
