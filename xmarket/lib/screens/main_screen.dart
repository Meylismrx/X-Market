import 'package:flutter/material.dart';

import 'add_product_page.dart';
import 'cart_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductPage()),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: _selectedIndex == 0 ? Colors.green : Colors.grey,
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: _selectedIndex == 1 ? Colors.green : Colors.grey,
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 48), // Space for FAB
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: _selectedIndex == 2 ? Colors.green : Colors.grey,
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: const Icon(Icons.person),
              color: _selectedIndex == 3 ? Colors.green : Colors.grey,
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
