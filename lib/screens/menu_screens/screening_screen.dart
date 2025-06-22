import 'package:flutter/material.dart';

class ScreeningScreen extends StatefulWidget {
  const ScreeningScreen({super.key});

  @override
  State<ScreeningScreen> createState() => _ScreeningScreenState();
}

class _ScreeningScreenState extends State<ScreeningScreen> {
  // Dummy data untuk jawaban default atau pilihan
  String _keadaanHariIni = 'Baik';
  String _mauDibicarakan = 'Ada';
  List<String> _gejalaDirasakan = ['Gelisah', 'Cemas', 'Stres'];
  String _merasaCemasAkhirIni = 'Ya';
  String _sudahBersyukurHariIni = 'Ya, sudah';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screening Kesehatan Mental'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jawab pertanyaan-pertanyaan berikut untuk mengetahui kondisi awal kesehatan mental Anda.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 25),

            // Pertanyaan 1
            _buildQuestionCard(
              'Bagaimana keadaanmu hari ini?',
              DropdownButtonFormField<String>(
                value: _keadaanHariIni,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: <String>['Baik', 'Cukup Baik', 'Kurang Baik', 'Tidak Baik']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _keadaanHariIni = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // Pertanyaan 2
            _buildQuestionCard(
              'Apa ada yang mau dibicarakan?',
              DropdownButtonFormField<String>(
                value: _mauDibicarakan,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: <String>['Ada', 'Tidak ada']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _mauDibicarakan = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // Pertanyaan 3 (Checkboxes)
            _buildQuestionCard(
              'Apa gejala yang kamu rasakan?',
              Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Gelisah'),
                    value: _gejalaDirasakan.contains('Gelisah'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _gejalaDirasakan.add('Gelisah');
                        } else {
                          _gejalaDirasakan.remove('Gelisah');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Cemas'),
                    value: _gejalaDirasakan.contains('Cemas'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _gejalaDirasakan.add('Cemas');
                        } else {
                          _gejalaDirasakan.remove('Cemas');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Stres'),
                    value: _gejalaDirasakan.contains('Stres'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _gejalaDirasakan.add('Stres');
                        } else {
                          _gejalaDirasakan.remove('Stres');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Sedih Berlebihan'),
                    value: _gejalaDirasakan.contains('Sedih Berlebihan'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _gejalaDirasakan.add('Sedih Berlebihan');
                        } else {
                          _gejalaDirasakan.remove('Sedih Berlebihan');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Kesulitan Tidur'),
                    value: _gejalaDirasakan.contains('Kesulitan Tidur'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _gejalaDirasakan.add('Kesulitan Tidur');
                        } else {
                          _gejalaDirasakan.remove('Kesulitan Tidur');
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Pertanyaan 4
            _buildQuestionCard(
              'Apa kamu merasakan cemas akhir-akhir ini?',
              Row(
                children: [
                  Radio<String>(
                    value: 'Ya',
                    groupValue: _merasaCemasAkhirIni,
                    onChanged: (String? value) {
                      setState(() {
                        _merasaCemasAkhirIni = value!;
                      });
                    },
                  ),
                  const Text('Ya'),
                  Radio<String>(
                    value: 'Tidak',
                    groupValue: _merasaCemasAkhirIni,
                    onChanged: (String? value) {
                      setState(() {
                        _merasaCemasAkhirIni = value!;
                      });
                    },
                  ),
                  const Text('Tidak'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Pertanyaan 5
            _buildQuestionCard(
              'Sudahkah kamu bersyukur hari ini?',
              Row(
                children: [
                  Radio<String>(
                    value: 'Ya, sudah',
                    groupValue: _sudahBersyukurHariIni,
                    onChanged: (String? value) {
                      setState(() {
                        _sudahBersyukurHariIni = value!;
                      });
                    },
                  ),
                  const Text('Ya, sudah'),
                  Radio<String>(
                    value: 'Belum',
                    groupValue: _sudahBersyukurHariIni,
                    onChanged: (String? value) {
                      setState(() {
                        _sudahBersyukurHariIni = value!;
                      });
                    },
                  ),
                  const Text('Belum'),
                ],
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitScreening,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Submit Screening',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method untuk membuat card pertanyaan
  Widget _buildQuestionCard(String question, Widget inputWidget) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            inputWidget,
          ],
        ),
      ),
    );
  }

  void _submitScreening() {
    // Di sini Anda bisa memproses jawaban jika diperlukan.
    // Untuk demo, kita langsung tampilkan respons dummy.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hasil Screening Sementara'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Keadaan hari ini: $_keadaanHariIni'),
                Text('Ada yang mau dibicarakan: $_mauDibicarakan'),
                Text('Gejala dirasakan: ${_gejalaDirasakan.join(', ')}'),
                Text('Merasa cemas akhir-akhir ini: $_merasaCemasAkhirIni'),
                Text('Sudah bersyukur hari ini: $_sudahBersyukurHariIni'),
                const Divider(),
                const Text(
                  '\nTerima kasih sudah berbagi. Berdasarkan jawaban Anda, kami menyarankan untuk terus memantau diri dan jangan ragu mencari bantuan profesional jika diperlukan. Tetap semangat!',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
          ],
        );
      },
    );
  }
}