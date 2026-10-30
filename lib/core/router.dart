import 'package:go_router/go_router.dart';

import '../features/auth/login_screen.dart';
import 'placeholder_screen.dart';

/// Routes mirror the "Application mobile (Flutter)" table in the
/// technical proposal doc, in the same order — add the real screen
/// there and switch its entry here, one row at a time.
final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (_, _) => const PlaceholderScreen(title: 'Inscription'),
    ),
    GoRoute(
      path: '/onboarding/profile',
      builder: (_, _) => const PlaceholderScreen(title: 'Profil — vous'),
    ),
    GoRoute(
      path: '/onboarding/interests',
      builder: (_, _) => const PlaceholderScreen(title: "Centres d'intérêt"),
    ),
    GoRoute(path: '/home', builder: (_, _) => const PlaceholderScreen(title: 'Accueil')),
    GoRoute(
      path: '/activities',
      builder: (_, _) => const PlaceholderScreen(title: 'Activités de groupe'),
    ),
    GoRoute(
      path: '/forum',
      builder: (_, _) => const PlaceholderScreen(title: "Forum d'échange"),
    ),
  ],
);
