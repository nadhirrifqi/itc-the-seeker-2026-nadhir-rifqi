import 'package:flutter/material.dart';
import '../data/pengurus_data.dart';
import '../models/pengurus_itc.dart';
import 'struktur_screen.dart';

class HomeScreen extends StatelessWidget {
  static const Color hijauTua = Color(0xFF1B5E20);
  static const Color hijauMuda = Color(0xFF4CAF50);

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Pengurus ketua = PengurusData.getKetua();
    Pengurus wakilKetua = PengurusData.getWakilKetua();
    int jumlahDivisi = PengurusData.getJumlahDivisi();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'ITC Directory',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: hijauTua,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // bagian header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_directory.jpeg'),
                      fit: BoxFit.cover,
                      opacity: 0.15,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.groups,
                        size: 80,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'ITC - Information Technology Club',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Community Organization',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // profil ITC 
                _buildProfilITC(),

                // highlight ketua
                _buildHighlightKetua(context, ketua),

                // jarak ketua dan wakil
                const SizedBox(height: 20),

                // highlight wakil ketua
                _buildHighlightWakilKetua(context, wakilKetua),

                // ringkasan divisi
                _buildRingkasanDivisi(jumlahDivisi),

                // tombol halaman struktur
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StrukturScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: hijauTua,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Lihat Struktur Organisasi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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

  // widget untuk profil ITC
  Widget _buildProfilITC() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage('assets/images/bg_pengurus.jpeg'),
          fit: BoxFit.cover,
          opacity: 0.15,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tentang ITC',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'ITC adalah komunitas teknologi informasi yang bergerak di bidang mobile development, web development, UI/UX Designer, Competitive Programming, Machine Learning, dan Project Manager. ITC bertujuan untuk membangun project nyata, berkolaborasi dalam tim, mempersiapkan kompetisi, dan mengembangkan portofolio.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  // widget untuk highlight ketua
  Widget _buildHighlightKetua(BuildContext context, Pengurus ketua) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: ketua);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage('assets/images/bg_pengurus.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ketua ITC',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(ketua.fotoUrl),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ketua.nama,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        ketua.jabatan,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4CAF50),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        ketua.divisi,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // widget untuk highlight wakil ketua
  Widget _buildHighlightWakilKetua(BuildContext context, Pengurus wakilKetua) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: wakilKetua);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage('assets/images/bg_pengurus.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wakil Ketua ITC',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(wakilKetua.fotoUrl),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wakilKetua.nama,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        wakilKetua.jabatan,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4CAF50),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        wakilKetua.divisi,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // widget untuk ringkasan divisi
  Widget _buildRingkasanDivisi(int jumlahDivisi) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage('assets/images/bg_pengurus.jpeg'),
          fit: BoxFit.cover,
          opacity: 0.15,
        ),
        boxShadow: [ BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoItem(
            Icons.business,
            '$jumlahDivisi',
            'Divisi',
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey[300],
          ),
          _buildInfoItem(
            Icons.people,
            '${PengurusData.daftarPengurus.length}',
            'Pengurus',
          ),
        ],
      ),
    );
  }

  // Widget untuk Item Info
  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: const Color(0xFF1B5E20),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B5E20),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}