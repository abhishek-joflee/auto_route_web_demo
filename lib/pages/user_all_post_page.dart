import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router/web_router.dart';

class UserAllPostsPage extends StatelessWidget {
  final VoidCallback? navigate;

  const UserAllPostsPage({Key? key, this.navigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'All Posts',
              style: TextStyle(fontSize: 28),
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: navigate ??
                  () {
                    context.pushRoute(const UserFavoritePostsRoute());
                  },
              child: const Text('Favorite'),
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: navigate ??
                  () {
                    context.navigateBack();
                  },
              child: const Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}
