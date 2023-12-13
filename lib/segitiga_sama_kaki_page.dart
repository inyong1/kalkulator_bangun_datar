import 'dart:math';

import 'package:flutter/material.dart';

class SegitigaSamaKakiPage extends StatefulWidget {
  const SegitigaSamaKakiPage({super.key});

  @override
  State<SegitigaSamaKakiPage> createState() => _SegitigaSamaKakiPageState();
}

class _SegitigaSamaKakiPageState extends State<SegitigaSamaKakiPage> {
  double alas = 0;
  double tinggi = 0;
  double sisiMiring = 0;
  double luas = 0.0;
  double keliling = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Segitiga Sama Kaki')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// untuk input nilai alas segitiga
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(hintText: 'Input nilai alas'),
              onChanged: (v) {
                // parse nilai yang diinput,
                // masukan ke variable alas
                alas = double.tryParse(v) ?? 0;
                // panggil fungsi perhitungan
                _calculate();
              },
            ),

            /// kasih jarak dengan nilai tinggi 10
            const SizedBox(height: 10),

            /// untuk input tinggi segitiga
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(hintText: 'Input nilai tinggi'),
              onChanged: (v) {
                // parse nilai yang diinput,
                // masukan ke variable tinggi
                tinggi = double.tryParse(v) ?? 0;
                // panggil fungsi perhitungan
                _calculate();
              },
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan sisi miring
            ListTile(
              title: Text(
                'Sisi miring ${sisiMiring.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text(
                  'Rumus: akar dari ((alas/2) kuadrat + tinggi kuadrat)'),
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan luas segitiga
            ListTile(
              title: Text(
                'Luas $luas',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text('Rumus:0,5 x alas x tinggi'),
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan keliling
            ListTile(
              title: Text(
                'Keliling ${keliling.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text('Rumus: alas + (2 x sisi miring)'),
            ),
          ],
        ),
      ),
    );
  }

  /// fungsi hitung luas dan keliling
  /// fungsi ini dipanggi setiap kali ada perubahan input
  void _calculate() {
    final temp = (alas / 2) * (alas / 2) + tinggi * tinggi;
    sisiMiring = sqrt(temp);
    luas = 0.5 * alas * tinggi;
    keliling = alas + (2 * sisiMiring);
    setState(() {});
  }
}
