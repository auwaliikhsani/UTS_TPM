// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/auwaliikhsani.jpeg'),
        ),
        const SizedBox(height: 20),
        const Text(
          'Muhammad Auwali Ikhsani',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          '123190127',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'TPM IF - E',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        const Text(
          'Tempat dan Tanggal Lahir:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        const Text(
          'Pontianak, 8 Januari 2001',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        const Text(
          'Cita-cita:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        const Text(
          'Bahagia dunia dan akhirat',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
