import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'savore_data.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAddToCart;

  const MenuCard({
    super.key,
    required this.item,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfacePlum,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.containerPlum, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              item.imageUrl,
              height: 115,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 115,
                color: AppColors.containerPlum,
                child: const Center(
                  child: Icon(Icons.fastfood, color: AppColors.champagneGold, size: 36),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.category.toUpperCase(),
                  style: const TextStyle(color: AppColors.metallicGold, fontSize: 10, letterSpacing: 1),
                ),
                const SizedBox(height: 2),
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatRupiah(item.price),
                      style: const TextStyle(color: AppColors.warmBeige, fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                    InkWell(
                      onTap: onAddToCart,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: AppColors.champagneGold,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, color: AppColors.bgDarkPlum, size: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}