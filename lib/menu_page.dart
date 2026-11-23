import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'savore_data.dart';
import 'menu_card.dart';

class MenuPage extends StatefulWidget {
  final String searchQuery;
  final Function(MenuItem) onAddToCart;

  const MenuPage({
    super.key,
    required this.searchQuery,
    required this.onAddToCart,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<String> categories = ['Semua', 'Western', 'Japanese', 'Ricebowl', 'Dessert', 'Drinks'];
  String selectedCategory = 'Semua';

  @override
  Widget build(BuildContext context) {
    final filteredMenus = sampleMenus.where((item) {
      final matchesCategory = selectedCategory == 'Semua' || item.category == selectedCategory;
      final matchesSearch = item.name.toLowerCase().contains(widget.searchQuery.toLowerCase()) ||
          item.category.toLowerCase().contains(widget.searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
          child: Text(
            'Menu Kami',
            style: TextStyle(color: AppColors.textWhite, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 44,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (_) => setState(() => selectedCategory = category),
                  selectedColor: AppColors.champagneGold,
                  backgroundColor: AppColors.surfacePlum,
                  labelStyle: TextStyle(
                    color: isSelected ? AppColors.bgDarkPlum : AppColors.textWhite,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  side: BorderSide(color: isSelected ? AppColors.metallicGold : AppColors.containerPlum),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: filteredMenus.isEmpty
              ? const Center(
                  child: Text('Menu tidak ditemukan.', style: TextStyle(color: AppColors.textMuted)),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredMenus.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.74,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredMenus[index];
                    return MenuCard(
                      item: item,
                      onAddToCart: () => widget.onAddToCart(item),
                    );
                  },
                ),
        ),
      ],
    );
  }
}