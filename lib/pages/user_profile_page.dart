import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../router/web_router.dart';

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
