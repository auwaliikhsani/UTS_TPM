// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';

class Trapesium extends StatefulWidget {
  const Trapesium({Key? key}) : super(key: key);

  @override
  _TrapesiumState createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  TextEditingController sisiAtasController = TextEditingController();
  TextEditingController sisiBawahController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  double luas = 0;
  double keliling = 0;

  void hitungLuas() {
    double sisiAtas = double.tryParse(sisiAtasController.text) ?? 0;
    double sisiBawah = double.tryParse(sisiBawahController.text) ?? 0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0;
    double luasTrapesium = ((sisiAtas + sisiBawah) * tinggi) / 2;
    setState(() {
      luas = luasTrapesium;
    });
  }

  void hitungKeliling() {
    double sisiAtas = double.tryParse(sisiAtasController.text) ?? 0;
    double sisiBawah = double.tryParse(sisiBawahController.text) ?? 0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0;
    double sisiMiring =
        sqrt(pow((sisiBawah - sisiAtas) / 2, 2) + pow(tinggi, 2));
    double kelilingTrapesium = sisiAtas + sisiBawah + (2 * sisiMiring);
    setState(() {
      keliling = kelilingTrapesium;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: sisiAtasController,
              decoration: const InputDecoration(
                labelText: 'Sisi atas',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: sisiBawahController,
              decoration: const InputDecoration(
                labelText: 'Sisi bawah',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tinggiController,
              decoration: const InputDecoration(
                labelText: 'Tinggi',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: hitungLuas,
              child: const Text('Hitung Luas'),
            ),
            const SizedBox(height: 16),
            Text('Luas: $luas'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: hitungKeliling,
              child: const Text('Hitung Keliling'),
            ),
            const SizedBox(height: 16),
            Text('Keliling: $keliling'),
          ],
        ),
      ),
    );
  }
}