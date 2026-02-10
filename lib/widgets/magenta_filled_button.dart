import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/theme.dart';
enum MagentaFilledButtonColor {
  magenta(magentaColour),
  black(Colors.black);

  const MagentaFilledButtonColor(this.value);
  final Color value;
}

class MagentaFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool border;
  final MagentaFilledButtonColor color;
  final Widget? child;
  const MagentaFilledButton({super.key, this.onPressed, this.border = false, this.color = .magenta, this.child, });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color?>(color.value),
          textStyle: WidgetStatePropertyAll<TextStyle?>(TextStyle(fontSize: 22.0)),
          shape: WidgetStatePropertyAll<OutlinedBorder?>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                side: border ? BorderSide(color: Colors.black) : BorderSide.none
              ),
          ),
          minimumSize: WidgetStatePropertyAll<Size?>(Size(80.0, 38.0)),
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(.zero),
        ),
        onPressed: onPressed,
        child: child
    );
  }
}
