import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko IC-Care'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Temukan buku dan produk yang mendukung kesehatan mental Anda.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            _buildShopItem(
              context,
              'assets/images/book_anxiety.png', // Tambahkan gambar ini nanti
              'Mengatasi Kecemasan: Panduan Praktis',
              'Buku ini menawarkan strategi kognitif-behavioral untuk mengelola kecemasan sehari-hari.',
              'Rp 95.000',
            ),
            const SizedBox(height: 15),
            _buildShopItem(
              context,
              'assets/images/book_mindfulness.png', // Tambahkan gambar ini nanti
              'Mindfulness untuk Hidup Tenang',
              'Pelajari teknik mindfulness untuk mengurangi stres dan meningkatkan fokus dalam kehidupan modern.',
              'Rp 120.000',
            ),
            const SizedBox(height: 15),
            _buildShopItem(
              context,
              'assets/images/book_depression.png', // Tambahkan gambar ini nanti
              'Bangkit dari Depresi: Kisah dan Inspirasi',
              'Kumpulan kisah nyata dan panduan untuk menemukan kembali harapan dan kebahagiaan setelah depresi.',
              'Rp 110.000',
            ),
            const SizedBox(height: 15),
            _buildShopItem(
              context,
              'assets/images/journal_kit.png', // Tambahkan gambar ini nanti
              'Self-Care Journal Kit',
              'Paket jurnal lengkap dengan panduan untuk melacak mood, mempraktikkan syukur, dan merencanakan self-care.',
              'Rp 150.000',
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Produk lainnya akan segera hadir!',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildShopItem(
      BuildContext context, String imagePath, String title, String description, String price) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Anda melihat detail produk: $title (Dummy)')),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 120,
                      color: Colors.grey[300],
                      child: Icon(Icons.book, size: 50, color: Colors.grey[600]),
                    );
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        price,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}