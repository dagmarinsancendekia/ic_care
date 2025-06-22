import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Mendatang'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jangan lewatkan event-event menarik seputar kesehatan mental!',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            _buildEventCard(
              context,
              'Webinar: Resilience di Era Digital',
              'Dr. Budi Santoso, Psikolog Klinis',
              'Sabtu, 20 Juli 2024, 10.00 WIB',
              'Online (Zoom Meeting)',
              MdiIcons.web,
            ),
            const SizedBox(height: 15),
            _buildEventCard(
              context,
              'Lokakarya Meditasi Mindfulness',
              'Santi Dewi, Praktisi Meditasi',
              'Minggu, 28 Juli 2024, 09.00 WIB',
              'Offline (Pusat Yoga Sehat Bahagia, Surakarta)',
              MdiIcons.nature,
            ),
            const SizedBox(height: 15),
            _buildEventCard(
              context,
              'Seminar Kesehatan Mental Remaja',
              'Prof. Dr. Irwan Setiawan, Psikiater',
              'Sabtu, 3 Agustus 2024, 14.00 WIB',
              'Online (Google Meet)',
              MdiIcons.accountGroup,
            ),
            const SizedBox(height: 15),
            _buildEventCard(
              context,
              'Kelas Mengelola Emosi',
              'Lina Wijaya, Terapis Emosi',
              'Jumat, 9 Agustus 2024, 19.00 WIB',
              'Offline (Komunitas Bahagia, Surakarta)',
              MdiIcons.emoticonHappyOutline,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Event baru akan terus diperbarui!',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(
      BuildContext context, String name, String speaker, String time, String location, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Melihat detail event: $name (Dummy)')),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 35, color: Colors.blue.shade700),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.person, size: 20, color: Colors.grey),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      speaker,
                      style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 20, color: Colors.grey),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      time,
                      style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(location.contains('Online') ? Icons.laptop_mac : Icons.location_on,
                      size: 20, color: Colors.grey),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      location,
                      style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Mendaftar untuk event: $name (Dummy)')),
                    );
                  },
                  icon: const Icon(Icons.event_note),
                  label: const Text('Daftar Event'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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