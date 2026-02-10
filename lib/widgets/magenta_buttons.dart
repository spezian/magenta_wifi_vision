import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/theme.dart';
enum MagentaSmallButtonColor { magenta, black }

class MagentaSmallButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool border;
  final MagentaSmallButtonColor color;
  final Widget? child;
  const MagentaSmallButton({super.key, this.onPressed, this.border = false, this.color = .magenta, this.child, });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color?>(color == .magenta ? magentaColour : Colors.black),
          textStyle: WidgetStatePropertyAll<TextStyle?>(TextStyle(fontSize: 22.0)),
          shape: WidgetStatePropertyAll<OutlinedBorder?>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                side: border ? BorderSide(color: Colors.black) : BorderSide.none
              ),
          ),
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(.symmetric(horizontal: 16.0)),
        ),
        onPressed: onPressed,
        child: child
    );
  }
}
