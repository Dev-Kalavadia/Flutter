import 'package:flutter/material.dart';
import 'qr_scan_page.dart'; // Importing the QR scanning page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  // Correction in the constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QRScanPage(),  // Using QRScanPage as the home page
    );
  }
}
