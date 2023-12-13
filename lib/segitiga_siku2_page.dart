import 'dart:math';

import 'package:flutter/material.dart';

class SegitigaSiku2Page extends StatefulWidget {
  const SegitigaSiku2Page({super.key});

  @override
  State<SegitigaSiku2Page> createState() => _SegitigaSiku2PageState();
}

class _SegitigaSiku2PageState extends State<SegitigaSiku2Page> {
  double sisiA = 0;
  double sisiB = 0;
  double sisiMiring = 0;
  double luas = 0.0;
  double keliling = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Segitiga Siku-siku')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// untuk input sisi A
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(hintText: 'Input nilai sisi A'),
              onChanged: (v) {
                // parse nilai yang diinput,
                // masukan ke variable sisiA
                sisiA = double.tryParse(v) ?? 0;
                // panggil fungsi perhitungan
                _calculate();
              },
            ),

            /// kasih jarak dengan nilai tinggi 10
            const SizedBox(height: 10),

            /// untuk input sisi B
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(hintText: 'Input nilai sisi B'),
              onChanged: (v) {
                // parse nilai yang diinput,
                // masukan ke variable sisiB
                sisiB = double.tryParse(v) ?? 0;
                // panggil fungsi perhitungan
                _calculate();
              },
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan sisi miring
            ListTile(
              title: Text(
                'Sisi C (sisi miring) ${sisiMiring.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text('Rumus: c kuadrat = a kuadrat + b kuadrat'),
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan luas segitiga
            ListTile(
              title: Text(
                'Luas $luas',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text('Rumus:0,5 x a x b'),
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan keliling
            ListTile(
              title: Text(
                'Keliling ${keliling.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text('Rumus: a + b + c'),
            ),
          ],
        ),
      ),
    );
  }

  /// fungsi hitung luas dan keliling
  /// fungsi ini dipanggi setiap kali ada perubahan input
  void _calculate() {
    final temp = sisiA * sisiA + sisiB * sisiB;
    sisiMiring = sqrt(temp);
    luas = 0.5 * sisiA * sisiB;
    keliling = sisiA + sisiB + sisiMiring;
    setState(() {});
  }
}
