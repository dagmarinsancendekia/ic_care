import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key});

  @override
  State<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  String _selectedFilter = 'Semua';

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. Sarah Amelia',
      'specialty': 'Psikiater',
      'photo': 'assets/images/doc_sarah.png', // Tambahkan gambar ini nanti
      'status': 'Online',
    },
    {
      'name': 'Psikolog Budi Santoso',
      'specialty': 'Psikolog Klinis',
      'photo': 'assets/images/doc_budi.png', // Tambahkan gambar ini nanti
      'status': 'Offline',
    },
    {
      'name': 'Terapis Maya Lestari',
      'specialty': 'Terapis Keluarga',
      'photo': 'assets/images/doc_maya.png', // Tambahkan gambar ini nanti
      'status': 'Online',
    },
    {
      'name': 'Dr. Anton Wijaya',
      'specialty': 'Psikiater Anak & Remaja',
      'photo': 'assets/images/doc_anton.png', // Tambahkan gambar ini nanti
      'status': 'Offline',
    },
    {
      'name': 'Psikolog Dewi Kartika',
      'specialty': 'Psikolog Pendidikan',
      'photo': 'assets/images/doc_dewi.png', // Tambahkan gambar ini nanti
      'status': 'Online',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredDoctors = _doctors.where((doctor) {
      if (_selectedFilter == 'Semua') {
        return true;
      } else {
        return doctor['specialty']!.contains(_selectedFilter);
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Konsultasi Online'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Temukan profesional kesehatan mental yang tepat untuk Anda.',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                // Filter Section
                const Text(
                  'Filter berdasarkan Spesialisasi:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip('Semua'),
                      _buildFilterChip('Psikiater'),
                      _buildFilterChip('Psikolog Klinis'),
                      _buildFilterChip('Terapis Keluarga'),
                      _buildFilterChip('Psikolog Pendidikan'),
                      _buildFilterChip('Psikiater Anak & Remaja'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return _buildDoctorCard(context, doctor);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(label),
        selected: _selectedFilter == label,
        selectedColor: Colors.blue.shade100,
        onSelected: (bool selected) {
          setState(() {
            _selectedFilter = selected ? label : 'Semua';
          });
        },
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, Map<String, String> doctor) {
    bool isOnline = doctor['status'] == 'Online';
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Melihat profil ${doctor['name']} (Dummy)')),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(doctor['photo']!),
                    onBackgroundImageError: (exception, stackTrace) {
                      // Fallback if image not found
                      const Icon(Icons.person, size: 50, color: Colors.grey);
                    },
                    child: doctor['photo']!.isEmpty
                        ? const Icon(Icons.person, size: 40, color: Colors.white)
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: isOnline ? Colors.green : Colors.grey,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor['name']!,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      doctor['specialty']!,
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      isOnline ? 'Status: Online' : 'Status: Offline',
                      style: TextStyle(
                        fontSize: 13,
                        color: isOnline ? Colors.green.shade700 : Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Memulai chat dengan ${doctor['name']} (Dummy)')),
                  );
                },
                icon: Icon(MdiIcons.chat),
                label: const Text('Chat'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}