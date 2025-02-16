import 'package:bein_mobile/pages/authentication/login_page.dart';
import 'package:bein_mobile/pages/authentication/registration_page.dart';
import 'package:bein_mobile/pages/authentication/splash_screen.dart';

import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/registration',
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
