import 'package:fifty_flutter_prjs/src/screens/Demos/demo_list.dart';
import 'package:go_router/go_router.dart';

import '../screens/ExpandingCards/expanding_cards.dart';

late final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'demolist',
      path: '/',
      builder: (context, state) => DemoList(),
    ),
    GoRoute(
      name: 'expanding_cards',
      path: '/expanding_cards',
      builder: (context, state) => const ExpandingCards(),
    ),
  ],
);
