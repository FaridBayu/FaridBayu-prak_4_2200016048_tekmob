// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Add text editing controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController =
      TextEditingController(); // Ditambahkan: Controller untuk input konfirmasi password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
                const SizedBox(height: 8.0),
                const Text(
                    'Registrasi'), // Ditambahkan: Teks untuk bagian registrasi
              ],
            ),
            const SizedBox(height: 150.0),
            const Text(
                'Masukkan nama user'), // Ditambahkan: Instruksi untuk memasukkan nama pengguna
            const SizedBox(
                height:
                    8.0), // Ditambahkan: Spasi antara instruksi dan kotak input
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            const Text(
                'Masukkan password'), // Ditambahkan: Instruksi untuk memasukkan password
            const SizedBox(
                height:
                    8.0), // Ditambahkan: Spasi antara instruksi dan kotak input
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 12.0),
            const Text(
                'Masukkan password kembali'), // Ditambahkan: Instruksi untuk mengonfirmasi password
            const SizedBox(
                height:
                    8.0), // Ditambahkan: Spasi antara instruksi dan kotak input
            TextField(
              controller:
                  _confirmPasswordController, // Ditambahkan: Controller untuk input konfirmasi password
              obscureText: true,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Confirm Password',
              ),
              onChanged: (value) {
                setState(() {
                  // Memicu re-render untuk menampilkan pesan validasi
                });
              },
            ),
            if (_passwordController.text !=
                _confirmPasswordController
                    .text) // Ditambahkan: Kondisi untuk menampilkan pesan kesalahan jika password tidak cocok
              const Text(
                'Password tidak sama!', // Ditambahkan: Pesan kesalahan jika password tidak cocok
                style: TextStyle(
                    color: Colors
                        .red), // Ditambahkan: Warna teks merah untuk pesan kesalahan
              ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    // Clear the text fields
                    _usernameController.clear();
                    _passwordController.clear();
                    _confirmPasswordController
                        .clear(); // Ditambahkan: Mengosongkan kotak input konfirmasi password
                  },
                ),
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    if (_passwordController.text ==
                        _confirmPasswordController.text) {
                      // Ditambahkan: Kondisi untuk memeriksa apakah password dan konfirmasi password cocok
                      // Show the next page
                      Navigator.pop(context);
                    } else {
                      // Show error message if passwords do not match
                      showDialog(
                        // Ditambahkan: Menampilkan dialog kesalahan jika password tidak cocok
                        context: context, // Ditambahkan: Konteks dialog
                        builder: (context) => AlertDialog(
                          // Ditambahkan: Konfigurasi dialog
                          title:
                              const Text('Error'), // Ditambahkan: Judul dialog
                          content: const Text(
                              'Password tidak sama!'), // Ditambahkan: Isi dialog
                          actions: <Widget>[
                            // Ditambahkan: Tombol aksi pada dialog
                            TextButton(
                              // Ditambahkan: Tombol "OK" untuk menutup dialog
                              child: const Text(
                                  'OK'), // Ditambahkan: Teks tombol "OK"
                              onPressed: () {
                                // Ditambahkan: Fungsi yang dipanggil saat tombol "OK" ditekan
                                Navigator.of(context)
                                    .pop(); // Ditambahkan: Menutup dialog
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
