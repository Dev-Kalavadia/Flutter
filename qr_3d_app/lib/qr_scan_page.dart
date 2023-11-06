import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      _navigateToShowScannedData(context, scanData.code);
    });
  }

  void _navigateToShowScannedData(BuildContext context, String scannedData) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Scanned QR Code'),
          content: Text(scannedData),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller
                    ?.resumeCamera(); // Resumes camera scan when dialog is closed
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
