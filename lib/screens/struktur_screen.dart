import 'package:flutter/material.dart';
import '../data/pengurus_data.dart';
import '../models/pengurus_itc.dart';

class StrukturScreen extends StatelessWidget {
  static const Color hijauTua = Color(0xFF1B5E20);

  const StrukturScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Struktur Organisasi',
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
          // background pengurus
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_struktur.jpeg'),
                fit: BoxFit.cover,
                opacity: 0.05,
              ),
            ),
          ),
          
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: PengurusData.daftarPengurus.length,
            itemBuilder: (context, index) {
              Pengurus pengurus = PengurusData.daftarPengurus[index];
              return _buildCardPengurus(context, pengurus);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCardPengurus(BuildContext context, Pengurus pengurus) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: pengurus);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage('assets/images/bg_pengurus.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.08,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            // profile pengurus
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(pengurus.fotoUrl),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(width: 16),
            // informasi pengurus
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pengurus.nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pengurus.jabatan,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4CAF50),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pengurus.divisi,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            // icon arrow
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF1B5E20),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}