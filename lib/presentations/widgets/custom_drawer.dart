import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back)),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    CircleAvatar(radius: 30),
                    SizedBox(width: 20),
                    Text('John Doe')
                  ],
                )
              ],
            ),
          ),
          ListTile(title: const Text('Billers'), onTap: () {}),
          ListTile(title: const Text('Transactions'), onTap: () {}),
          ListTile(title: const Text('Account'), onTap: () {}),
          ListTile(title: const Text('Support'), onTap: () {}),
          ListTile(title: const Text('Log out'), onTap: () {}),
        ],
      ),
    );
  }
}
