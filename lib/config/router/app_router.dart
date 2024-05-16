import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/counter',
      name: CounterScreen.routeName,
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.routeName,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.routeName,
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.routeName,
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackBarScreen.routeName,
      builder: (context, state) => const SnackBarScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.routeName,
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.routeName,
      builder: (context, state) => const UiControlsScreen()
    ),
    GoRoute(
      path: '/app-tutorial',
      name: AppTutorialScreen.routeName,
      builder: (context, state) => const AppTutorialScreen()
    ),
    GoRoute(
      path: '/infinite',
      name: InfiniteScrollScreen.routeName,
      builder: (context, state) => const InfiniteScrollScreen()
    ),
  ],
);