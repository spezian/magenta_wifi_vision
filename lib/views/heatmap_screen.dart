import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/widgets/app_bar.dart';

class HeatmapScreen extends StatefulWidget {
  const HeatmapScreen({super.key});

  @override
  State<HeatmapScreen> createState() => _HeatmapScreenState();
}

class _HeatmapScreenState extends State<HeatmapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MagentaAppBar(title: Text("Layout Name")),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 256.0,
              child: Column(
                spacing: 4.0,
                children: [
                  Container(
                    height: 36.0,
                    margin: .only(top: 36.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: .centerLeft,
                        end: .centerRight,
                        colors: <Color>[
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Good",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        "Bad",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/example_heatmap.png", scale: 2),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 8.0,
        children: [
          FloatingActionButton(
            onPressed: () {},
            shape: CircleBorder(),
            child: Icon(Icons.edit_outlined),
          ),
          FloatingActionButton(
            onPressed: () {},
            shape: CircleBorder(),
            child: Icon(Icons.lightbulb_outline),
          ),
          FloatingActionButton(
            onPressed: () {},
            shape: CircleBorder(),
            child: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
