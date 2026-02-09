import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/theme.dart';
import 'package:magenta_wifi_vision/views/home/history_view.dart';
import 'package:magenta_wifi_vision/views/home/scan_view.dart';

import 'home/settings_view.dart';

class HomeScreen extends StatefulWidget {
  bool _historyAddMode = false;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool Function()? _firstFabAction;
  VoidCallback? _secondFabAction;

  int _selectedViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: [
        null,
        AppBar(
          title: Text("History"),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(8.0),
              child: Container(
                color: Colors.black12,
                height: 1.0,
              )
          ),
        ),
        AppBar(
          title: Text("Settings"),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(8.0),
              child: Container(
                color: Colors.black12,
                height: 1.0,
              )
          ),
        ),
      ][_selectedViewIndex],
      body: [
        ScanView(),
        HistoryView(
          onActionFabPressed: (callback) => _firstFabAction = callback,
          onCreateFabPressed: (callback) => _secondFabAction = callback,
        ),
        SettingsView()
      ][_selectedViewIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: [
        null,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8.0,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  widget._historyAddMode = _firstFabAction!();
                });
              },
              shape: CircleBorder(),
              child: widget._historyAddMode ? Icon(Icons.close) : Icon(Icons.add),
            ),
            if (widget._historyAddMode) ...[
              FloatingActionButton.extended(
                  onPressed: _secondFabAction,
                  shape: RoundedRectangleBorder(borderRadius: .circular(999.0)),
                  label: Text(
                      "Combine Selected Rooms",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                  )
              )
            ]
          ],
        ),
        null,
      ][_selectedViewIndex],
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black12)
          )
        ),
        child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                _selectedViewIndex = index;
              });
            },
            indicatorColor: Colors.transparent,
            selectedIndex: _selectedViewIndex,
            backgroundColor: Colors.transparent,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            destinations: const <Widget>[
              NavigationDestination(
                  icon: Icon(Icons.home_outlined, color: Colors.black),
                  selectedIcon: Icon(Icons.home, color: magentaColour,),
                  label: "Home"
              ),
              NavigationDestination(
                  icon: Icon(Icons.history_outlined, color: Colors.black),
                  selectedIcon: Icon(Icons.history, color: magentaColour,),
                  label: "History"
              ),
              NavigationDestination(
                  icon: Icon(Icons.settings_outlined, color: Colors.black),
                  selectedIcon: Icon(Icons.settings, color: magentaColour,),
                  label: "Settings"
              )
            ]
        ),
      ),
    );
  }
}
