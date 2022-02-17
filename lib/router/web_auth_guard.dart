import 'package:auto_route/auto_route.dart';

import '../auth/auth_service.dart';
import 'web_router.dart';

class AuthGuard extends AutoRedirectGuard {
  final AuthService authService;

  AuthGuard(this.authService) {
    authService.addListener(reevaluate);
  }

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    if (authService.isAuthenticated) {
      resolver.next();
    } else {
      redirect(const LoginRoute(), resolver: resolver);
    }
  }
}
