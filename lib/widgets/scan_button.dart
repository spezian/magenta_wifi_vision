import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final EdgeInsetsGeometry? padding;
  const ScanButton({super.key, this.padding, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color?>(Colors.white),
          foregroundColor: WidgetStatePropertyAll<Color?>(Colors.black),
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(padding ?? .all(0)),
          side: WidgetStatePropertyAll<BorderSide?>(BorderSide(color: Colors.black, width: 2))
      ),
      icon: icon,
    );
  }
}
