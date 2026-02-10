import 'package:flutter/material.dart';

class MagentaDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  const MagentaDialog({super.key, this.title, this.content, this.actions});

  @override
  Widget build(BuildContext context) {
    Widget? titleWidget;
    if (title != null) {
      titleWidget = DefaultTextStyle(
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          child: title!
      );
    }

    Widget? contentWidget;
    if (content != null) {
      contentWidget = DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          child: content!
      );
    }

    return AlertDialog(
      title: titleWidget,
      content: contentWidget,
      contentPadding: .only(top: 2.0, bottom: 12.0),
      actionsAlignment: .center,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: .circular(16.0)
      ),
      actions: [
        Row(
          spacing: 8.0,
          children: List<Widget>.generate(actions?.length ?? 0,
              (index) => Expanded(
                  child: actions![index],
              ),
          ),
        )
      ],
    );
  }
}
