import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:wow_shopping/features/connection_monitor/connection_monitor.dart';
import 'package:wow_shopping/features/main/widgets/bottom_nav_bar.dart';

export 'package:wow_shopping/models/nav_item.dart';

@immutable
class MainScreen extends StatefulWidget {
  const MainScreen._();

  static Route<void> route() {
    return PageRouteBuilder(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeTransition(
          opacity: animation,
          child: const MainScreen._(),
        );
      },
    );
  }

  static MainScreenState of(BuildContext context) {
    return context.findAncestorStateOfType<MainScreenState>()!;
  }

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  Command<NavItem, NavItem> toggleNavItem = Command.createSync(
    (item) => item,
    initialValue: NavItem.home,
  );

  void gotoSection(NavItem item) {
    toggleNavItem(item);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: toggleNavItem,
        builder: (context, item, _) {
          return SizedBox.expand(
            child: Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ConnectionMonitor(
                      child: IndexedStack(
                        index: item.index,
                        children: [
                          for (final item in NavItem.values) //
                            item.builder(),
                        ],
                      ),
                    ),
                  ),
                  BottomNavBar(
                    onNavItemPressed: gotoSection,
                    selected: item,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
