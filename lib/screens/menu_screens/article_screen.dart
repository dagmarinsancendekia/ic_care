import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel Kesehatan Mental'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Baca artikel-artikel pilihan untuk meningkatkan pemahaman Anda tentang kesehatan mental.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            _buildArticleCard(
                context,
                'assets/images/article_stress.png', // Tambahkan gambar ini nanti
                '5 Cara Efektif Mengelola Stres Harian',
                'Stres adalah bagian tak terhindarkan dari hidup, tetapi bagaimana kita mengelolanya dapat membuat perbedaan besar. Artikel ini membahas lima strategi sederhana namun ampuh untuk menjaga tingkat stres tetap terkendali...',
                '''
              Stres adalah respons alami tubuh terhadap tantangan atau tuntutan. Dalam jumlah kecil, stres bisa memotivasi. Namun, stres kronis dapat berdampak negatif pada kesehatan fisik dan mental.

              Berikut adalah 5 cara efektif untuk mengelola stres harian:
              1.  **Bernapas Dalam (Deep Breathing):** Latihan pernapasan dalam dapat menenangkan sistem saraf Anda. Tarik napas perlahan melalui hidung, tahan beberapa detik, lalu hembuskan perlahan melalui mulut. Ulangi beberapa kali.
              2.  **Aktivitas Fisik:** Berolahraga secara teratur adalah pereda stres yang sangat baik. Bahkan jalan kaki singkat pun dapat melepaskan endorfin yang meningkatkan mood.
              3.  **Cukup Tidur:** Kurang tidur dapat memperburuk stres. Pastikan Anda mendapatkan 7-9 jam tidur berkualitas setiap malam. Ciptakan rutinitas tidur yang menenangkan.
              4.  **Praktikkan Mindfulness:** Sadari momen saat ini tanpa penilaian. Anda bisa mencoba meditasi singkat atau hanya fokus pada sensasi saat Anda makan atau berjalan.
              5.  **Jaga Hubungan Sosial:** Berbicara dengan teman atau keluarga tentang perasaan Anda bisa sangat membantu. Dukungan sosial adalah penopang penting saat menghadapi stres.
              '''
            ),
            const SizedBox(height: 15),
            _buildArticleCard(
                context,
                'assets/images/article_sleep.png', // Tambahkan gambar ini nanti
                'Pentingnya Tidur Cukup untuk Kesehatan Mental',
                'Tidur bukan hanya tentang istirahat fisik, tetapi juga krusial untuk pemulihan dan kesehatan mental. Kurang tidur dapat memengaruhi mood, konsentrasi, dan kemampuan mengatasi emosi...',
                '''
              Tidur adalah fondasi bagi kesehatan mental yang baik. Selama tidur, otak Anda memproses informasi, mengonsolidasi memori, dan mengatur emosi.

              **Dampak Kurang Tidur pada Kesehatan Mental:**
              * **Perubahan Mood:** Anda mungkin merasa lebih mudah tersinggung, cemas, atau sedih.
              * **Penurunan Konsentrasi:** Sulit fokus, mengambil keputusan, atau memecahkan masalah.
              * **Peningkatan Stres:** Tubuh Anda memproduksi lebih banyak hormon stres saat kurang tidur.
              * **Memperburuk Kondisi Mental:** Dapat memperburuk gejala depresi, kecemasan, atau gangguan mental lainnya.

              **Tips Tidur Berkualitas:**
              1.  **Jadwal Tidur Teratur:** Tidur dan bangun pada waktu yang sama setiap hari, bahkan di akhir pekan.
              2.  **Ciptakan Lingkungan Tidur Nyaman:** Gelap, tenang, dan sejuk.
              3.  **Hindari Kafein dan Alkohol:** Terutama sebelum tidur.
              4.  **Batasi Paparan Layar:** Cahaya biru dari gadget dapat mengganggu produksi melatonin.
              5.  **Relaksasi Sebelum Tidur:** Mandi air hangat, membaca buku, atau mendengarkan musik menenangkan.
              '''
            ),
            const SizedBox(height: 15),
            _buildArticleCard(
                context,
                'assets/images/article_teenager.png', // Tambahkan gambar ini nanti
                'Mengenali Tanda-tanda Depresi pada Remaja',
                'Depresi pada remaja seringkali disalahartikan sebagai "moody" biasa. Mengenali tanda-tandanya sejak dini sangat penting untuk memberikan dukungan yang tepat...',
                '''
              Depresi pada remaja adalah masalah kesehatan mental serius yang dapat memengaruhi cara remaja berpikir, merasakan, dan bertindak. Ini bukan sekadar fase "moody" yang akan berlalu.

              **Tanda-tanda Depresi pada Remaja yang Perlu Diperhatikan:**
              * **Perubahan Mood:** Kesedihan yang persisten, mudah marah, atau kehilangan minat pada aktivitas yang dulu dinikmati.
              * **Perubahan Pola Tidur:** Insomnia atau tidur berlebihan.
              * **Perubahan Pola Makan:** Penurunan atau peningkatan nafsu makan yang signifikan.
              * **Penurunan Energi:** Merasa lelah sepanjang waktu, tidak bersemangat.
              * **Masalah Konsentrasi:** Sulit fokus di sekolah atau saat melakukan tugas.
              * **Perasaan Tidak Berharga/Bersalah:** Merasa tidak berguna atau terlalu menyalahkan diri sendiri.
              * **Nyeri Fisik Tanpa Sebab Jelas:** Sakit kepala, sakit perut, atau keluhan fisik lainnya.
              * **Pikiran tentang Kematian/Bunuh Diri:** Ini adalah tanda paling serius dan membutuhkan perhatian medis segera.

              **Apa yang Bisa Dilakukan Orang Tua/Orang Terdekat:**
              1.  **Dengarkan Tanpa Menghakimi:** Berikan ruang bagi remaja untuk berbicara.
              2.  **Cari Bantuan Profesional:** Konsultasikan dengan psikolog atau psikiater anak dan remaja.
              3.  **Dukung Gaya Hidup Sehat:** Dorong aktivitas fisik, pola makan sehat, dan tidur cukup.
              4.  **Jaga Komunikasi Terbuka:** Pastikan remaja tahu Anda ada untuk mereka.
              '''
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Lebih banyak artikel akan segera diunggah!',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildArticleCard(
      BuildContext context, String imagePath, String title, String snippet, String fullContent) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          // Navigasi ke halaman detail artikel
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailScreen(
                title: title,
                imagePath: imagePath,
                content: fullContent,
              ),
            ),
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
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 90,
                      color: Colors.grey[300],
                      child: Icon(Icons.article, size: 50, color: Colors.grey[600]),
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
                      snippet,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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

// Halaman Detail Artikel
class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String content;

  const ArticleDetailScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, size: 100, color: Colors.grey[600]),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}