import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'savore_data.dart';
import 'home_page.dart';
import 'menu_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'about_page.dart';

void main() {
  runApp(const SavoreApp());
}

class SavoreApp extends StatelessWidget {
  const SavoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAVORE - Food & Beverage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgDarkPlum,
        primaryColor: AppColors.metallicGold,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.champagneGold,
          secondary: AppColors.metallicGold,
          surface: AppColors.surfacePlum,
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  String _searchQuery = '';
  bool _isSearching = false;
  final Map<MenuItem, int> _cart = {};

  void _addToCart(MenuItem item) {
    setState(() {
      _cart[item] = (_cart[item] ?? 0) + 1;
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${item.name} ditambahkan ke keranjang',
          style: const TextStyle(color: AppColors.bgDarkPlum, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.champagneGold,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _removeFromCart(MenuItem item) {
    setState(() {
      if (_cart.containsKey(item)) {
        if (_cart[item]! > 1) {
          _cart[item] = _cart[item]! - 1;
        } else {
          _cart.remove(item);
        }
      }
    });
  }

  void _deleteFromCart(MenuItem item) {
    setState(() {
      _cart.remove(item);
    });
  }

  int get _totalCartItems => _cart.values.fold(0, (sum, qty) => sum + qty);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(
        onAddToCart: _addToCart,
        onNavigateToMenu: () => setState(() => _selectedIndex = 1),
      ),
      MenuPage(
        searchQuery: _searchQuery,
        onAddToCart: _addToCart,
      ),
      CartPage(
        cart: _cart,
        onAdd: _addToCart,
        onRemove: _removeFromCart,
        onDelete: _deleteFromCart,
        onClear: () => setState(() => _cart.clear()),
      ),
      const ProfilePage(),
      const AboutPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgDarkPlum,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: AppColors.containerPlum, height: 1),
        ),
        title: _isSearching
            ? TextField(
                autofocus: true,
                style: const TextStyle(color: AppColors.textWhite),
                decoration: const InputDecoration(
                  hintText: 'Cari makanan atau minuman...',
                  hintStyle: TextStyle(color: AppColors.textMuted),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                    if (_selectedIndex != 1) _selectedIndex = 1;
                  });
                },
              )
            : Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.surfacePlum,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.metallicGold, width: 1.2),
                    ),
                    child: const Center(
                      child: Text(
                        'S',
                        style: TextStyle(
                          color: AppColors.champagneGold,
                          fontFamily: 'Serif',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SAVORE',
                        style: TextStyle(
                          color: AppColors.metallicGold,
                          fontFamily: 'Serif',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 2.5,
                        ),
                      ),
                      Text(
                        'FOOD & BEVERAGE',
                        style: TextStyle(
                          color: AppColors.warmBeige,
                          fontSize: 9,
                          letterSpacing: 1.6,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search, color: AppColors.champagneGold),
            tooltip: 'Pencarian',
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) _searchQuery = '';
              });
            },
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.champagneGold),
                tooltip: 'Keranjang Belanja',
                onPressed: () => setState(() => _selectedIndex = 2),
              ),
              if (_totalCartItems > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.champagneGold,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$_totalCartItems',
                      style: const TextStyle(
                        color: AppColors.bgDarkPlum,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.containerPlum, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: AppColors.surfacePlum,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.champagneGold,
          unselectedItemColor: AppColors.textMuted,
          selectedFontSize: 12,
          unselectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), activeIcon: Icon(Icons.grid_view_rounded), label: 'Menu'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), activeIcon: Icon(Icons.shopping_bag), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.info_outline), activeIcon: Icon(Icons.info), label: 'Tentang'),
          ],
        ),
      ),
    );
  }
}