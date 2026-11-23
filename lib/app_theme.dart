import 'package:flutter/material.dart';

class AppColors {
  static const Color bgDarkPlum = Color(0xFF1B0D24);
  static const Color surfacePlum = Color(0xFF281533);
  static const Color containerPlum = Color(0xFF351D42);
  static const Color champagneGold = Color(0xFFE6C697);
  static const Color metallicGold = Color(0xFFC8A26B);
  static const Color warmBeige = Color(0xFFF3DEC0);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFFB5A4BE);
}

String formatRupiah(int amount) {
  return 'Rp ${amount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
}