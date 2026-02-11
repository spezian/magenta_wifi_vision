import 'package:flutter/material.dart';

import '../theme.dart';
import 'magenta_outline_input_border.dart';

class MagentaTextFormField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const MagentaTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  @override
  State<MagentaTextFormField> createState() => _MagentaTextFormFieldState();
}

class _MagentaTextFormFieldState extends State<MagentaTextFormField> {
  String? error;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        enabledBorder: MagentaOutlineInputBorder(
          borderRadius: .circular(16.0),
          borderSide: BorderSide(color: foregroundColor, width: 1.0),
        ),
        focusedBorder: MagentaOutlineInputBorder(
          borderRadius: .circular(16.0),
          borderSide: BorderSide(color: magentaColour, width: 1.0),
        ),
        errorBorder: MagentaOutlineInputBorder(
          borderRadius: .circular(16.0),
          borderSide: BorderSide(color: Colors.red[900]!, width: 2.0),
        ),
        focusedErrorBorder: MagentaOutlineInputBorder(
          borderRadius: .circular(16.0),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.focused) &&
              states.contains(WidgetState.error)) {
            return TextStyle(color: Colors.red);
          }

          if (states.contains(WidgetState.focused)) {
            return TextStyle(color: magentaColour);
          }

          if (states.contains(WidgetState.error)) {
            return TextStyle(color: Colors.red[900]);
          }

          return TextStyle(color: Colors.grey[800]);
        }),
        hintStyle: TextStyle(color: Colors.grey[800]),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: Colors.white,
        filled: true,
        error: error != null
            ? Padding(
                padding: const .only(bottom: 8.0),
                child: Row(
                  spacing: 4.0,
                  children: [
                    Icon(Icons.warning_rounded, color: Colors.red),
                    Text(error!, style: Theme.of(context).textTheme.labelLarge),
                  ],
                ),
              )
            : null,
      ),
      controller: widget.controller,
      obscuringCharacter: '*',
      obscureText: widget.obscureText,
      validator: widget.validator != null
          ? (String? value) {
              error = null;

              error = widget.validator!(value);

              setState(() {
                error = error;
              });

              return null;
            }
          : null,
    );
  }
}
