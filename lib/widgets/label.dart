import 'package:flutter/material.dart';

import '../theme.dart';

class MagentaLabel extends StatelessWidget {
  final String text;

  const MagentaLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.labelMedium!.copyWith(color: magentaColour),
    );
  }
}
