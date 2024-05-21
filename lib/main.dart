import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    title: 'Barcode Scanner App',
    home: ScanScreen(),
  ));
}

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // Color for the scan line
      'Cancel', // Text for the cancel button
      true, // Show the flash icon
      ScanMode.BARCODE,
    );

    // if (barcodeScanRes != '-1' && barcodeScanRes.startsWith('FNSKU:')) {
    // Extract FNSKU barcode data
    String fnskuData = barcodeScanRes.substring(6);

    // Save FNSKU data to storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('scannedFNSKU', fnskuData);

    // Show a success message
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Success'),
        content: Text(barcodeScanRes),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: scanBarcode,
          child: Text('Scan Barcode'),
        ),
      ),
    );
  }
}
