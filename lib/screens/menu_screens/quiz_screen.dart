import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tes Kesehatan Mental'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Uji pemahaman Anda tentang kesehatan mental dengan berbagai tes singkat.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            _buildQuizOption(
              context,
              'Tes Depresi',
              'Evaluasi tingkat depresi Anda dengan serangkaian pertanyaan singkat.',
              MdiIcons.emoticonSadOutline,
              Colors.red.shade700,
            ),
            const SizedBox(height: 15),
            _buildQuizOption(
              context,
              'Tes Kecemasan',
              'Kenali gejala kecemasan dan bagaimana dampaknya pada kehidupan sehari-hari.',
              MdiIcons.emoticonFrownOutline, // Changed icon
              Colors.orange.shade700,
            ),
            const SizedBox(height: 15),
            _buildQuizOption(
              context,
              'Tes PTSD (Traumatic Stress)',
              'Pahami lebih lanjut tentang Post-Traumatic Stress Disorder dan gejalanya.',
              MdiIcons.hospitalBuilding,
              Colors.purple.shade700,
            ),
            const SizedBox(height: 15),
            _buildQuizOption(
              context,
              'Tes Tingkat Stres',
              'Ukur tingkat stres Anda saat ini dan dapatkan rekomendasi awal.',
              MdiIcons.alertCircleOutline, // Changed icon
              Colors.teal.shade700,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Tes lainnya akan segera ditambahkan!',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQuizOption(
      BuildContext context, String title, String description, IconData icon, Color iconColor) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Anda mengambil tes: $title (Dummy)')),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 40, color: iconColor),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Memulai tes: $title (Dummy)')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Ambil Tes'),
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