import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/not_found_screen.dart';
import '../pages/user_all_post_page.dart';
import '../pages/user_fav_posts_page.dart';
import '../pages/user_page.dart';
import '../pages/user_post_page.dart';
import '../pages/user_profile_page.dart';
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
