import 'package:flutter/material.dart';
import 'package:food_runner_flutter/themes/colors.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: orange),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: PlayAnimationBuilder<double>(
                    tween: Tween(begin: -200.0, end: 0.0),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOutSine,
                    builder: (ctx, value, child) {
                      return Transform.translate(
                        offset: Offset(value, 0),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      'assets/food_runner_logo.png',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            selected: index == 0,
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            selected: index == 1,
            leading: const Icon(Icons.person),
            title: const Text('My Account'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            selected: index == 2,
            leading: const Icon(Icons.favorite_border),
            title: const Text('Favorite Restaurants'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            selected: index == 3,
            leading: const Icon(Icons.help),
            title: const Text('FAQ'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            selected: index == 4,
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
