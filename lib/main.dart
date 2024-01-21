import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriped/app/data/services/auth_service.dart';
import 'package:nutriped/app/ui/pages/login_page.dart';
import 'package:nutriped/app/ui/pages/access_page.dart';
import 'package:nutriped/app/ui/pages/register_page.dart';
import 'package:nutriped/app/ui/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
      routes: [
        GoRoute(
          path: 'access',
          name: '/access',
          builder: (context, state) => const AccessPage(),
        ),
        GoRoute(
          path: 'login',
          name: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: 'register',
          name: '/register',
          builder: (context, state) => const RegisterPage(),
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}
