import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/views/heatmap_screen.dart';

import '../../widgets/label.dart';

class HistoryView extends StatefulWidget {
  final Function(bool Function()) onActionFabPressed;
  final Function(VoidCallback) onCreateFabPressed;

  const HistoryView({
    super.key,
    required this.onActionFabPressed,
    required this.onCreateFabPressed,
  });

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  /// Shows if the user is currently trying to create a new layout.
  bool _isAddMode = false;

  @override
  void initState() {
    super.initState();

    // Give the FABs from StartScreen a function.
    widget.onActionFabPressed(_handleActionFabPressed);
    widget.onCreateFabPressed(_handleCreateFabPressed);
  }

  bool _handleActionFabPressed() {
    setState(() {
      _isAddMode = !_isAddMode;
    });

    return _isAddMode;
  }

  void _handleCreateFabPressed() {}

  // So we can save the state of the tiles. For demonstration purposes.
  Map<int, bool> roomValues = {};
  Map<int, bool> layoutValues = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16.0),

      // We use a CustomScrollView to implement multiple lists and static widgets in one scrollable list.
      // Instead of widgets it uses slivers which are widgets specific for scrollable lists.
      child: CustomScrollView(
        slivers: [
          // We use this to add normal widgets.
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
              child: MagentaLabel("Room"),
            ),
          ),

          // Room
          // We already know the height of each tile so we can use this builder
          // so that every child has the same height because it's more performant.
          SliverFixedExtentList.builder(
            itemBuilder: (context, index) {
              roomValues[index] = false;

              return Padding(
                padding: const .only(bottom: 10.0),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: _isAddMode
                          // Show checkboxes if we want to create a new layout.
                          ? () => setState(() {
                              roomValues[index] = !roomValues[index]!;
                            })
                          // Else just show the heatmap.
                          : () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HeatmapScreen(),
                              ),
                            ),
                      trailing: _isAddMode
                          ? Checkbox(
                              value: roomValues[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  roomValues[index] = value!;
                                });
                              },
                            )
                          : Icon(Icons.chevron_right),
                    );
                  },
                ),
              );
            },
            itemCount: 3,
            itemExtent: 58.0,
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: MagentaLabel("Layout"),
            ),
          ),

          // Layout
          SliverFixedExtentList.builder(
            itemBuilder: (context, index) {
              layoutValues[index] = false;

              return Padding(
                padding: const .only(bottom: 10.0),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: _isAddMode
                          ? () => setState(() {
                              layoutValues[index] = !layoutValues[index]!;
                            })
                          : () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HeatmapScreen(),
                              ),
                            ),
                      trailing: _isAddMode
                          ? Checkbox(
                              value: layoutValues[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  layoutValues[index] = value!;
                                });
                              },
                            )
                          : Icon(Icons.chevron_right),
                    );
                  },
                ),
              );
            },
            itemCount: 4,
            itemExtent: 58.0,
          ),
        ],
      ),
    );
  }
}
