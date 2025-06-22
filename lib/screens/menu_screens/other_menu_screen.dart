import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OtherMenuScreen extends StatelessWidget {
  const OtherMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Lain-lain'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildListTile(context, 'Setelan', Icons.settings, 'Mengatur preferensi aplikasi'),
            _buildListTile(context, 'Bantuan (Help)', Icons.help_outline, 'Mencari bantuan atau FAQ'),
            _buildListTile(context, 'Riwayat Aktivitas', Icons.history, 'Melihat riwayat penggunaan aplikasi'),
            _buildListTile(context, 'Meditasi', MdiIcons.meditation, 'Panduan meditasi untuk relaksasi'),
            _buildListTile(context, 'Wallpaper Motivasi', Icons.image, 'Mengganti wallpaper motivasi'),
            _buildListTile(context, 'Donasi', Icons.favorite_border, 'Dukung misi IC-Care'),
            _buildListTile(context, 'To-Do List', Icons.checklist, 'Manajemen tugas harian'),
            _buildListTile(context, 'Akun Saya', Icons.account_circle, 'Lihat dan edit informasi akun'),
            // Tambahkan menu lainnya jika diperlukan
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, IconData icon, String subtitle) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Anda masuk ke menu: $title (Dummy)')),
          );
          // Di sini Anda bisa menambahkan navigasi ke halaman spesifik untuk setiap menu
          // Contoh:
          // if (title == 'Meditasi') {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MeditationScreen()));
          // }
        },
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Colors.blue.shade700),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}