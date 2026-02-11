import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/views/heatmap_screen.dart';

import '../../widgets/magenta_label.dart';

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
  bool _isAddMode = false;

  @override
  void initState() {
    super.initState();
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

  Map<int, bool> roomValues = {};
  Map<int, bool> layoutValues = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
              child: MagentaLabel("Room"),
            ),
          ),
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
                          ? () => setState(() {
                        roomValues[index] = !roomValues[index]!;
                      }) : () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HeatmapScreen(),
                          )
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
                  }
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
                      }) : () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HeatmapScreen(),
                          )
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
                  }
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
