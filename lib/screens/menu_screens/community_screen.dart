import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Komunitas IC-Care'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bergabunglah dengan komunitas kami untuk saling mendukung dan berbagi pengalaman.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            _buildCommunityButton(
              context,
              'Always Dzikr',
              'Membangun ketenangan batin melalui zikir setiap hari menurut ajaran Islam. Mari kuatkan iman dan mental bersama.',
              Icons.mosque, // Ikon masjid atau doa
            ),
            const SizedBox(height: 15),
            _buildCommunityButton(
              context,
              'Pelajar Indonesia Sehat',
              'Komunitas untuk mendukung kesehatan mental dan fisik pelajar di seluruh Indonesia. Berbagi tips belajar, manajemen stres, dan hidup seimbang.',
              Icons.school, // Ikon sekolah
            ),
            const SizedBox(height: 15),
            _buildCommunityButton(
              context,
              'Komunitas Sehat Mental',
              'Ruang aman untuk berbagi pengalaman, dukungan emosional, dan belajar strategi coping dari sesama anggota. Bersama kita kuat!',
              Icons.people, // Ikon orang
            ),
            const SizedBox(height: 15),
            _buildCommunityButton(
              context,
              'Generasi Bahagia',
              'Fokus pada kebahagiaan dan optimisme. Diskusi positif, aktivitas menyenangkan, dan berbagi kisah inspiratif.',
              Icons.emoji_events, // Ikon kebahagiaan/prestasi
            ),
            const SizedBox(height: 15),
            _buildCommunityButton(
              context,
              'Pejuang Kecemasan',
              'Dukungan khusus bagi mereka yang berjuang melawan kecemasan. Berbagi pengalaman, strategi coping, dan dukungan kelompok.',
              Icons.lightbulb, // Ikon ide/pencerahan
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Lebih banyak komunitas akan datang!',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityButton(BuildContext context, String title, String description, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Anda bergabung dengan komunitas: $title (Dummy)')),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.blue.shade700),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}