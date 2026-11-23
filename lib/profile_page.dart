import 'package:flutter/material.dart';
import 'app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {'icon': Icons.inventory_2_outlined, 'title': 'Pesanan Saya'},
      {'icon': Icons.favorite_border, 'title': 'Favorit'},
      {'icon': Icons.notifications_none, 'title': 'Notifikasi'},
      {'icon': Icons.settings_outlined, 'title': 'Pengaturan'},
      {'icon': Icons.headset_mic_outlined, 'title': 'Bantuan'},
      {'icon': Icons.info_outline, 'title': 'Tentang Aplikasi'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.metallicGold, width: 2),
            ),
            child: const CircleAvatar(
              radius: 48,
              backgroundColor: AppColors.containerPlum,
              child: Icon(Icons.person, size: 54, color: AppColors.champagneGold),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Nadia Alysyia',
            style: TextStyle(color: AppColors.textWhite, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            'nadia@email.com',
            style: TextStyle(color: AppColors.textMuted, fontSize: 13),
          ),
          const SizedBox(height: 24),
          ...menuItems.map(
            (menu) => Card(
              color: AppColors.surfacePlum,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(color: AppColors.containerPlum, width: 0.8),
              ),
              child: ListTile(
                leading: Icon(menu['icon'] as IconData, color: AppColors.champagneGold),
                title: Text(menu['title'] as String, style: const TextStyle(color: AppColors.textWhite)),
                trailing: const Icon(Icons.chevron_right, color: AppColors.textMuted),
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout, size: 18),
              label: const Text('Keluar', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.champagneGold,
                foregroundColor: AppColors.bgDarkPlum,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}