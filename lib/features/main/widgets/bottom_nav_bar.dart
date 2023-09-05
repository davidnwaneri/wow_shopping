import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wow_shopping/app/theme.dart';
import 'package:wow_shopping/models/nav_item.dart';
import 'package:wow_shopping/widgets/app_icon.dart';
import 'package:wow_shopping/widgets/common.dart';

export 'package:wow_shopping/models/nav_item.dart';

@immutable
class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
    // required this.onNavItemPressed,
    // required this.selected,
  });

  // final ValueChanged<NavItem> onNavItemPressed;
  // final NavItem selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);
    return Material(
      color: appTheme.appBarColor,
      child: Padding(
        padding: EdgeInsets.only(bottom: viewPadding.bottom),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final item in NavItem.values) //
                Expanded(
                  child: BottomNavButton(
                    onPressed: () => ref.read(counterProvider.notifier).update((_) => item),
                    item: item,
                    selected: ref.watch(counterProvider),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class BottomNavButton extends StatelessWidget {
  const BottomNavButton({
    super.key,
    required this.onPressed,
    required this.item,
    required this.selected,
  });

  final VoidCallback onPressed;

  // final ValueChanged<NavItem> onPressed;
  final NavItem item;
  final NavItem selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: verticalPadding12 + bottomPadding4,
        child: AppIcon(
          iconAsset: item.navIconAsset,
          highlighted: (item == selected),
        ),
      ),
    );
  }
}

final counterProvider = StateProvider<NavItem>((ref) => NavItem.home);
