/// Start screen of the app.
import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/theme.dart';
import 'package:magenta_wifi_vision/views/start/history_view.dart';
import 'package:magenta_wifi_vision/views/start/start_scan_view.dart';
import 'package:magenta_wifi_vision/widgets/app_bar.dart';

import 'start/settings_view.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  /// The function returned by a view and it can return the new state of the FAB to be set in [_fabActionState].
  bool? Function()? _firstFabAction;

  /// The function returned by a view for a second FAB.
  VoidCallback? _secondFabAction;

  /// The current state of the first FAB. Can be used for example to show and hide the second FAB. It's updated by the return value of [_firstFabAction].
  bool _fabActionState = false;

  /// Current selected page.
  int _selectedViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    /* Essentially we have a main scaffold and the user switches between views
     * which ARE NOT scaffolds because nested scaffolds are difficult to work with.
     *
     * We put the view and its associated appBar/FAB in lists and select the wanted
     * widgets with the current page index.
     *
     * Some views (or just one currently: HistoryView) also need FABs
     * but they only can be defined on a scaffold, so we define the FAB here
     * and use a callback so that the view can return a function which will
     * be triggered when the user presses the FAB. We also have a variable
     * to show and hide a potential second FAB -> _fabActionState. The
     * callback updates the state.
     *
     */
    return Scaffold(
      appBar: [
        null,
        MagentaAppBar(title: Text("History")),
        MagentaAppBar(title: Text("Settings")),
      ][_selectedViewIndex],

      body: [
        StartScanView(),
        HistoryView(
          onActionFabPressed: (callback) => _firstFabAction = callback,
          onCreateFabPressed: (callback) => _secondFabAction = callback,
        ),
        SettingsView(),
      ][_selectedViewIndex],

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
                  _fabActionState = _firstFabAction!()!;
                });
              },
              child: _fabActionState ? Icon(Icons.close) : Icon(Icons.add),
            ),
            if (_fabActionState) ...[
              FloatingActionButton.extended(
                onPressed: _secondFabAction,
                shape: RoundedRectangleBorder(borderRadius: .circular(999.0)),
                label: Text(
                  "Combine Selected Rooms",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Colors.white),
                ),
              ),
            ],
          ],
        ),
        null,
      ][_selectedViewIndex],

      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12)), // small bar
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _fabActionState = false; // reset state on page switch.
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
              selectedIcon: Icon(Icons.home, color: magentaColour),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.history_outlined, color: Colors.black),
              selectedIcon: Icon(Icons.history, color: magentaColour),
              label: "History",
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined, color: Colors.black),
              selectedIcon: Icon(Icons.settings, color: magentaColour),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
