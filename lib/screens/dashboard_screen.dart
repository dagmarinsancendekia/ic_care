import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'; // Untuk ikon

// Import halaman-halaman menu lainnya (akan dibuat nanti)
import 'package:ic_care/screens/menu_screens/screening_screen.dart';
import 'package:ic_care/screens/menu_screens/community_screen.dart';
import 'package:ic_care/screens/menu_screens/shop_screen.dart';
import 'package:ic_care/screens/menu_screens/article_screen.dart';
import 'package:ic_care/screens/menu_screens/consultation_screen.dart';
import 'package:ic_care/screens/menu_screens/quiz_screen.dart';
import 'package:ic_care/screens/menu_screens/event_screen.dart';
import 'package:ic_care/screens/menu_screens/other_menu_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _userName = 'Pengguna'; // Default name

  // Untuk Bottom Navigation Bar
  int _selectedIndex = 0; // Indeks halaman yang aktif

  // Daftar halaman yang akan ditampilkan di Bottom Navigation Bar
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _loadUserName();
    _widgetOptions = <Widget>[
      _buildHomeScreen(), // Home screen content
      const Text('Halaman Donasi (Dummy)'), // Placeholder untuk Donasi
      const Text('Halaman Notifikasi (Dummy)'), // Placeholder untuk Notifikasi
      const Text('Halaman Akun (Dummy)'), // Placeholder untuk Akun
    ];
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('user_name') ?? 'Pengguna';
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Widget untuk membangun tampilan "Home" di dalam Bottom Nav Bar
  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Peta Indonesia
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/indonesia_map_banner.png'), // Akan kita tambahkan nanti
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Text(
                'Selamat Datang di IC-Care',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, $_userName!',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Dummy Tombol Pencarian
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari informasi atau layanan...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  readOnly: true, // Tidak bisa diketik, hanya dummy
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fungsi Pencarian (Dummy)')),
                    );
                  },
                ),
                const SizedBox(height: 25),
                const Text(
                  'Fitur Unggulan Kami:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                // Grid Menu Utama
                GridView.count(
                  shrinkWrap: true, // Penting agar GridView tidak error di dalam SingleChildScrollView
                  physics: const NeverScrollableScrollPhysics(), // Non-scrollable
                  crossAxisCount: 3, // 3 kolom
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _buildMenuItem('Screening', MdiIcons.brain, () => const ScreeningScreen()),                    _buildMenuItem('Komunitas', MdiIcons.accountGroup, () => const CommunityScreen()),
                    _buildMenuItem('Belanja', MdiIcons.cart, () => const ShopScreen()),
                    _buildMenuItem('Artikel', MdiIcons.bookOpenVariant, () => const ArticleScreen()),
                    _buildMenuItem('Konsultasi', MdiIcons.forum, () => const ConsultationScreen()),
                    _buildMenuItem('Kuis', MdiIcons.headQuestion, () => const QuizScreen()),                    _buildMenuItem('Event', MdiIcons.calendarStar, () => const EventScreen()),
                    _buildMenuItem('Lain-lain', MdiIcons.dotsHorizontal, () => const OtherMenuScreen()),
                  ],
                ),
                const SizedBox(height: 30),
                // Infografik Banner Dummy
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.shade100,
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/infographic_banner.png'), // Akan kita tambahkan nanti
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Jaga Kesehatan Mentalmu Setiap Hari!\n#ICareForYou',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk membuat item menu
  Widget _buildMenuItem(String title, IconData icon, Widget Function() targetScreenBuilder) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreenBuilder()),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: Colors.blue.shade700),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard IC-Care'),
        centerTitle: true,
        automaticallyImplyLeading: false, // Menghilangkan tombol back di dashboard
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // Menampilkan halaman sesuai indeks BottomNav
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.heart),
            label: 'Donasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.bell),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountCircle),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Penting agar label selalu terlihat
      ),
    );
  }
}