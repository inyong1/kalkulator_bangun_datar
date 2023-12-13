import 'package:flutter/material.dart';

class PersegiPage extends StatefulWidget {
  const PersegiPage({super.key});

  @override
  State<PersegiPage> createState() => _PersegiPageState();
}

class _PersegiPageState extends State<PersegiPage> {
  double panjang = 0;
  double lebar = 0;
  double luas = 0.0;
  double keliling = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Persegi')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// untuk input panjang
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration:
                  const InputDecoration(hintText: 'Input nilai panjang'),
              onChanged: (v) {
                // parse nilai panjang yang diinput,
                // masukan ke variable panjang
                panjang = double.tryParse(v) ?? 0;
                // panggil fungsi perhitungan
                _calculate();
              },
            ),

            /// kasih jarak dengan nilai tinggi 10
            const SizedBox(height: 10),

            /// untuk input lebar
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(hintText: 'Input nilai lebar'),
              onChanged: (v) {
                // parse nilai lebar yang diinput,
                // masukan ke variable lebar
                lebar = double.tryParse(v) ?? 0;
                // panggil fungsi perhitungan
                _calculate();
              },
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan luas persegi
            ListTile(
              title: Text(
                'Luas $luas',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text('Rumus: panjang x lebar'),
            ),
            const SizedBox(height: 16),

            /// hasil perhitungan keliling
            ListTile(
              title: Text(
                'Keliling $keliling',
                style: const TextStyle(fontSize: 24),
              ),
              subtitle: const Text('Rumus: 2 x (lebar +  panjang)'),
            ),
          ],
        ),
      ),
    );
  }

  /// fungsi hitung luas dan keliling
  /// fungsi ini dipanggi setiap kali ada perubahan input
  void _calculate() {
    luas = panjang * lebar;
    keliling = 2 * (panjang + lebar);
    setState(() {});
  }
}
