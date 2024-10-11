import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 45,
              ),
            ),
            accountName: Text('댕댕이조아'),
            accountEmail: Text('dangdang@gmail.com'),
          ),
          ListTile(
            title: const Text('MyPage'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('알림 설정'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Customer Service'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
