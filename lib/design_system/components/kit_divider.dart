import 'package:flutter/widgets.dart';

import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';

class KitDivider extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: ColoredBox(color: KitTheme.of(context).colors.outline),
    );
  }
}
