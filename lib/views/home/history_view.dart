import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/theme.dart';

class HistoryView extends StatefulWidget {
  final Function(VoidCallback) onFabPressed;
  const HistoryView({super.key, required this.onFabPressed});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
              "Room",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: magentaColour
            )
          ),
        ),
        SliverFixedExtentList.builder(
            itemBuilder: (context, index) {
              return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                  ),
                child: Row(
                  children: [
                    Text("$index"),
                    Icon(Icons.chevron_right),
                  ],
                ),
              );
            },
            itemExtent: 48.0
        ),
        SliverToBoxAdapter(
          child: Text(
              "Layout",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: magentaColour
              )
          ),
        ),
        SliverFixedExtentList.builder(
            itemBuilder: (context, index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
                child: Row(
                  children: [
                    Text("$index"),
                    Icon(Icons.chevron_right),
                  ],
                ),
              );
            },
            itemExtent: 48.0
        )
      ],
    );
  }
}
