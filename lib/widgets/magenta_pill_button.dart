import 'package:flutter/material.dart';

import '../theme.dart';

class MagentaPillButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final double _fontSize;
  final EdgeInsetsGeometry _padding;
  const MagentaPillButton.large({super.key, this.onPressed, this.child}) : _fontSize = 20.0, _padding = const .symmetric(horizontal: 8.0, vertical: 16.0);
  const MagentaPillButton.small({super.key, this.onPressed, this.child}) : _fontSize = 16.0, _padding = const .symmetric(horizontal: 0.0, vertical: 12.0);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(magentaColour),
      ),
        onPressed: onPressed,
        child: DefaultTextStyle(
          style: TextStyle(fontSize: _fontSize, fontFamily: 'ABeeZee'),
          child: Padding(
            padding: _padding,
            child: child,
          ),
        )
    );
  }
}
