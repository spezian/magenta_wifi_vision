import 'package:flutter/material.dart';

class MagentaSmallButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool border;
  final Widget? child;
  const MagentaSmallButton({super.key, this.onPressed, this.child, this.border = false});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ButtonStyle(
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
