import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../features/showcase/presentation/showcase_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => KitPage<void>(
        key: state.pageKey,
        child: const ShowcaseScreen(),
      ),
    ),
  ],
);

class KitPage<T> extends Page<T> {
  const KitPage({
    required this.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder<T>(
      settings: this,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          child,
    );
  }
}
