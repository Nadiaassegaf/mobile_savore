import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'savore_data.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfacePlum,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.metallicGold, width: 1.2),
            ),
            child: const Column(
              children: [
                Text(
                  'SAVORE',
                  style: TextStyle(
                    color: AppColors.metallicGold,
                    fontFamily: 'Serif',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.5,
                  ),
                ),
                Text(
                  'FOOD & BEVERAGE',
                  style: TextStyle(color: AppColors.warmBeige, fontSize: 12, letterSpacing: 2),
                ),
                SizedBox(height: 12),
                Text(
                  'EXQUISITE TASTE, ELEVATED EXPERIENCE',
                  style: TextStyle(color: AppColors.champagneGold, fontSize: 11, letterSpacing: 1.5),
                ),
                SizedBox(height: 14),
                Text(
                  'SAVORE merupakan aplikasi restoran digital yang menyediakan berbagai pilihan makanan dan minuman serta memudahkan pengguna melihat dan memilih menu.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textWhite, fontSize: 13, height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Identitas Aplikasi',
            style: TextStyle(color: AppColors.champagneGold, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surfacePlum,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.containerPlum, width: 1),
            ),
            child: const Column(
              children: [
                _IdentityRow(label: 'Kategori', value: 'Kuliner / Restoran'),
                Divider(color: AppColors.containerPlum),
                _IdentityRow(label: 'Platform', value: 'Android'),
                Divider(color: AppColors.containerPlum),
                _IdentityRow(label: 'Framework', value: 'Flutter'),
                Divider(color: AppColors.containerPlum),
                _IdentityRow(label: 'Bahasa', value: 'Dart'),
                Divider(color: AppColors.containerPlum),
                _IdentityRow(label: 'Tema', value: 'Modern, Elegan, Minimalis'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Anggota Kelompok',
            style: TextStyle(color: AppColors.champagneGold, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...teamMembers.map(
            (member) => Card(
              color: AppColors.surfacePlum,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(color: AppColors.containerPlum),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.containerPlum,
                  child: Text(
                    member.name[0],
                    style: const TextStyle(color: AppColors.champagneGold, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  member.name,
                  style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'NPM: ${member.npm}\n${member.role}',
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
                isThreeLine: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IdentityRow extends StatelessWidget {
  final String label;
  final String value;

  const _IdentityRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
          Text(value, style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
}