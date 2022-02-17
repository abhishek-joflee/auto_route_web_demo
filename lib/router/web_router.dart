import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../main.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/not_found_screen.dart';
import '../pages/user_all_post_page.dart';
import '../pages/user_fav_posts_page.dart';
import '../pages/user_page.dart';
import '../pages/user_post_page.dart';
import 'web_auth_guard.dart';

// optionally add part directive to use
// pare builder
part 'web_router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      initial: true,
    ),
    AutoRoute(path: '/login', page: LoginPage),
    RedirectRoute(
      path: '/user/:userID',
      redirectTo: '/user/:userID/page',
    ),
    AdaptiveRoute(
      path: '/user/:userID/page',
      guards: [AuthGuard],
      page: UserPage,
      children: [
        AutoRoute(
          path: '',
          page: UserProfilePage,
          // initial: true,
        ),
        AutoRoute(
          path: 'posts',
          page: UserPostsPage,
          children: [
            AutoRoute(
              path: 'all',
              page: UserAllPostsPage,
              initial: true,
            ),
            AutoRoute(
              path: 'favorite',
              page: UserFavoritePostsPage,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(path: '*', page: NotFoundScreen),
  ],
)
// when using a part build you should not
// use the '$' prefix on the actual class
// instead extend the generated class
// prefixing it with '_$'
class WebAppRouter extends _$WebAppRouter {
  WebAppRouter(
    AuthService authService,
  ) : super(
          authGuard: AuthGuard(authService),
        );
}

class UserProfilePage extends StatelessWidget {
  final VoidCallback? navigate;
  final int likes;
  final int userId;
  const UserProfilePage({
    Key? key,
    this.navigate,
    @PathParam('userID') this.userId = -1,
    @queryParam this.likes = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'User Profile : $userId  likes: $likes}',
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              '${context.routeData.queryParams}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 16),
            MaterialButton(
              color: Colors.red,
              onPressed: navigate ??
                  () {
                    context.pushRoute(const UserPostsRoute());
                  },
              child: const Text('Posts'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: navigate ??
                  () {
                    App.of(context).authService.isAuthenticated = false;
                  },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
