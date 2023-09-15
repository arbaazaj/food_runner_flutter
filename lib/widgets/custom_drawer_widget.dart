import 'package:flutter/material.dart';
import 'package:food_runner_flutter/themes/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: orange),
            child: Column(
              children: [
                Image.asset(
                  'assets/food_runner_logo.png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('Favorites'),
          ),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
          ),
          const ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log out'),
          ),
        ],
      ),
    );
  }
}
