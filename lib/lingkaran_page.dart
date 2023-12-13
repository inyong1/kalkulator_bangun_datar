import 'dart:math';

import 'package:flutter/material.dart';

class LingkaranPage extends StatefulWidget {
  const LingkaranPage({super.key});

  @override
  State<LingkaranPage> createState() => _LingkaranPageState();
}

class _LingkaranPageState extends State<LingkaranPage> {
  double jari2 = 0;
  double luas = 0.0;
  double keliling = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Lingkaran')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// untuk input jari-jari lingkaran
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  hintText: 'Input nilai jari-jari lingkaran'),
              onChanged: (v) {
                // parse nilai lebar yang diinput,
                // masukan ke variable lebar
                jari2 = double.tryParse(v) ?? 0;
                // panggil fungsi perhitungan
                _calculate();
              },
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan luas persegi
            ListTile(
              title: Text(
                'Luas ${luas.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text('Rumus: pi x jari-jari x jari-jari'),
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan keliling
            ListTile(
              title: Text(
                'Keliling ${keliling.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text('Rumus: 2 x pi * jari-jari'),
            ),
          ],
        ),
      ),
    );
  }

  /// fungsi hitung luas dan keliling
  /// fungsi ini dipanggi setiap kali ada perubahan input
  void _calculate() {
    luas = pi * jari2 * jari2;
    keliling = 2 * pi * jari2;
    setState(() {});
  }
}
