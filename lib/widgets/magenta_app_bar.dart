import 'package:flutter/material.dart';

import '../theme.dart';

class MagentaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const MagentaAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: ModalRoute.of(context)?.impliesAppBarDismissal ?? false
          ? IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.of(context).maybePop(),
            )
          : null,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(8.0),
        child: Container(color: greyColor, height: 1.0),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8.0);
}
