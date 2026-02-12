import 'package:flutter/material.dart';

class MagentaDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool showBackChevron;

  const MagentaDialog({
    super.key,
    this.title,
    this.content,
    this.showBackChevron = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    Widget? titleWidget;
    if (title != null) {
      titleWidget = DefaultTextStyle(
        style: Theme.of(context).textTheme.titleLarge!,
        textAlign: TextAlign.center,
        child: title!,
      );
    }

    Widget? contentWidget;
    if (content != null) {
      contentWidget = DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyLarge!,
        textAlign: TextAlign.center,
        child: content!,
      );
    }

    return AlertDialog(
      title: showBackChevron && title != null
          ? Stack(
              children: [
                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 2.0),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: Icon(Icons.chevron_left, size: 32.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const .only(top: 24.0),
                  child: Align(
                    alignment: AlignmentGeometry.center,
                    child: titleWidget!,
                  ),
                ),
              ],
            )
          : Padding(padding: const .only(top: 24.0), child: titleWidget),
      titlePadding: .zero,
      content: contentWidget,
      contentPadding: .only(top: 4.0, bottom: 12.0, left: 12.0, right: 12.0),
      actionsAlignment: .center,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 2.0),
        borderRadius: .circular(16.0),
      ),
      actions: [
        Row(
          spacing: 8.0,
          children: List<Widget>.generate(
            actions?.length ?? 0,
            (index) => Expanded(child: actions![index]),
          ),
        ),
      ],
    );
  }
}
