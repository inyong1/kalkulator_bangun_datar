import 'package:flutter/material.dart';
import 'package:kalkulator_bangun_datar/persegi_page.dart';
import 'package:kalkulator_bangun_datar/segitiga_sama_kaki_page.dart';
import 'package:kalkulator_bangun_datar/segitiga_siku2_page.dart';

import 'lingkaran_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'KALKULATOR BANGUN DATAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'By Rafazka Khoirul Anam',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 10),
                const Text(
                  'SMP AL MUSTHAFA',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                /// tombol menuju Persegi Page
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PersegiPage()),
                    );
                  },
                  child: const Text('PERSEGI'),
                ),

                /// Tombo menuju LingkaranPage
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LingkaranPage()),
                    );
                  },
                  child: const Text('LINGKARAN'),
                ),

                /// tombol menuju SegitigaSiku2Page
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SegitigaSiku2Page()),
                    );
                  },
                  child: const Text('SEGI TIGA SIKU-SIKU'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SegitigaSamaKakiPage()),
                    );
                  },
                  child: const Text('SEGI TIGA SAMA KAKI'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
