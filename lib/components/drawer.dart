import 'package:crud/components/drawer_tile.dart';
import 'package:crud/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // header
          const DrawerHeader(
            child: Icon(Icons.menu_book_rounded),
          ),

          const SizedBox(
            height: 25,
          ),
          //notes tile
          DrawerTile(
            title: "Notes",
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // setting tile
          DrawerTile(
            title: "Settings",
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
