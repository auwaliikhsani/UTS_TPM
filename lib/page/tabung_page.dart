// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';

class Tabung extends StatefulWidget {
  const Tabung({Key? key});

  @override
  _TabungState createState() => _TabungState();
}

class _TabungState extends State<Tabung> {
  TextEditingController jariJariController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  double luas = 0;
  double volume = 0;

  void hitungLuas() {
    double jariJari = double.tryParse(jariJariController.text) ?? 0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0;
    double luasTabung = 2 * pi * jariJari * (jariJari + tinggi);
    setState(() {
      luas = luasTabung;
    });
  }

  void hitungVolume() {
    double jariJari = double.tryParse(jariJariController.text) ?? 0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0;
    double volumeTabung = pi * pow(jariJari, 2) * tinggi;
    setState(() {
      volume = volumeTabung;
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
              controller: jariJariController,
              decoration: const InputDecoration(
                labelText: 'Jari-jari',
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
              onPressed: hitungVolume,
              child: const Text('Hitung Volume'),
            ),
            const SizedBox(height: 16),
            Text('Volume: $volume'),
          ],
        ),
      ),
    );
  }
}
