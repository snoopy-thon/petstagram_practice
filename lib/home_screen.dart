import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petstagram_practice/home/community_page.dart';
import 'package:petstagram_practice/home/feed_page.dart';
import 'package:petstagram_practice/home/ranking_page.dart';

import 'home/menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext con, AsyncSnapshot<User?> user) {
        if (!user.hasData) {
          return const LoginPhonePage();
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Petstagram'),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications)),
                IconButton(
                  onPressed: () async => FirebaseAuth.instance.signOut().then(
                        (_) => Navigator.pushNamed(context, "/"),
                      ),
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            drawer: const MenuDrawer(),
            body: IndexedStack(
              index: _selectedIndex,
              children: const [
                FeedPage(),
                LoginPhonePage(),
                RankingPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              backgroundColor: Colors.grey[50],
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: '커뮤니티',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.military_tech),
                  label: '랭킹',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
