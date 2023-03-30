import 'package:go_router/go_router.dart';

import '../../experiment/test_repository/ui/test_repository_screen.dart';

const introPageName = 'intro';
const introPagePath = '/intro';

final GoRouter mainRouter = GoRouter(
  initialLocation: introPagePath,
  routes: <RouteBase>[
    GoRoute(
      name: introPageName,
      path: introPagePath,
      builder: (context, state) => const TestRepositoryScreen(),
    ),
  ],
);
