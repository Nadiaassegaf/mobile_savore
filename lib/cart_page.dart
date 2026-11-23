import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'savore_data.dart';

class CartPage extends StatelessWidget {
  final Map<MenuItem, int> cart;
  final Function(MenuItem) onAdd;
  final Function(MenuItem) onRemove;
  final Function(MenuItem) onDelete;
  final VoidCallback onClear;

  const CartPage({
    super.key,
    required this.cart,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
    required this.onClear,
  });

  int get totalPrice => cart.entries.fold(0, (sum, entry) => sum + (entry.key.price * entry.value));

  @override
  Widget build(BuildContext context) {
    if (cart.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 70, color: AppColors.textMuted),
            SizedBox(height: 12),
            Text('Keranjang belanja Anda masih kosong', style: TextStyle(color: AppColors.textMuted, fontSize: 16)),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final entry = cart.entries.elementAt(index);
              final item = entry.key;
              final qty = entry.value;

              return Card(
                color: AppColors.surfacePlum,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: const BorderSide(color: AppColors.containerPlum),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(item.imageUrl, width: 55, height: 55, fit: BoxFit.cover),
                  ),
                  title: Text(item.name, style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold)),
                  subtitle: Text(formatRupiah(item.price), style: const TextStyle(color: AppColors.warmBeige)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, color: AppColors.champagneGold),
                        onPressed: () => onRemove(item),
                      ),
                      Text('$qty', style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, color: AppColors.metallicGold),
                        onPressed: () => onAdd(item),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                        onPressed: () => onDelete(item),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.surfacePlum,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            border: Border(top: BorderSide(color: AppColors.metallicGold, width: 0.8)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Pembayaran', style: TextStyle(color: AppColors.textMuted, fontSize: 15)),
                  Text(
                    formatRupiah(totalPrice),
                    style: const TextStyle(color: AppColors.champagneGold, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    onClear();
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: AppColors.surfacePlum,
                        title: const Text('Pesanan Berhasil!', style: TextStyle(color: AppColors.champagneGold)),
                        content: const Text(
                          'Terima kasih telah memesan di SAVORE. Pesanan Anda sedang disiapkan oleh chef kami.',
                          style: TextStyle(color: AppColors.textWhite),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK', style: TextStyle(color: AppColors.metallicGold)),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.champagneGold,
                    foregroundColor: AppColors.bgDarkPlum,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Pesan Sekarang', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}