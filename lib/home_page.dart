import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'savore_data.dart';
import 'menu_card.dart';

class HomePage extends StatelessWidget {
  final Function(MenuItem) onAddToCart;
  final VoidCallback onNavigateToMenu;

  const HomePage({
    super.key,
    required this.onAddToCart,
    required this.onNavigateToMenu,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteMenus = sampleMenus.take(4).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello,',
            style: TextStyle(color: AppColors.warmBeige, fontSize: 15),
          ),
          const Text(
            'Nadia! 👋',
            style: TextStyle(color: AppColors.textWhite, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [Color(0xFF331842), Color(0xFF200F2B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: AppColors.metallicGold, width: 1.2),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dine in Luxury\nat Savore',
                        style: TextStyle(
                          color: AppColors.warmBeige,
                          fontFamily: 'Serif',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton(
                        onPressed: onNavigateToMenu,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.champagneGold,
                          foregroundColor: AppColors.bgDarkPlum,
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Order Now →', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    sampleMenus[0].imageUrl,
                    width: 115,
                    height: 115,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 115,
                      height: 115,
                      color: AppColors.containerPlum,
                      child: const Icon(Icons.restaurant, color: AppColors.champagneGold, size: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Menu Favorit',
                style: TextStyle(color: AppColors.textWhite, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: onNavigateToMenu,
                child: const Text('Lihat Semua →', style: TextStyle(color: AppColors.champagneGold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: favoriteMenus.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.74,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final item = favoriteMenus[index];
              return MenuCard(
                item: item,
                onAddToCart: () => onAddToCart(item),
              );
            },
          ),
        ],
      ),
    );
  }
}