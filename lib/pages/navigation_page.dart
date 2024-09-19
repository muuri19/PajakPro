import 'package:flutter/material.dart';
import 'package:pajakpro/pages/article_page.dart';
import 'package:pajakpro/pages/dashboard_page.dart';

class NavigationPage extends StatefulWidget {
  static const routeName = 'navigation-page';
  const NavigationPage({super.key});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [const DashboardPage(), const ArticlePage()];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
        icon: const Icon(
          Icons.account_balance_rounded,
          color: Colors.black45,
        ),
        activeIcon: Icon(
          Icons.account_balance_rounded,
          color: Colors.green.shade900,
        ),
        label: 'Pajak',
        backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: const Icon(
          Icons.library_books_rounded,
          color: Colors.black45,
        ),
        activeIcon: Icon(
          Icons.library_books_rounded,
          color: Colors.green.shade900,
        ),
        label: 'Artikel',
        backgroundColor: Colors.white),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.green.shade900,
        unselectedItemColor: Colors.black45,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
