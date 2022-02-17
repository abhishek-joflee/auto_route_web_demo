import 'package:flutter/material.dart';

import './router/web_router.dart';
import 'auth/auth_service.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType<AppState>()!;
  }
}

class AppState extends State<App> {
  late final authService = AuthService()
    ..addListener(() {
      setState(() {});
    });
  late final _appRouter = WebAppRouter(authService);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: _appRouter.routeInfoProvider(),
      routerDelegate: _appRouter.delegate(
          // onNavigate: (UrlState state, bool initial) {},
          // routes: (_) => [
          //   if (authService.isAuthenticated)
          //     HomeRoute()
          //   else
          //     LoginRoute(),
          // ],
          ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
