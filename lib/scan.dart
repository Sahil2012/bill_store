// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ScanScreen extends StatefulWidget {
//   @override
//   _ScanScreenState createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> {
//   MobileScannerController cameraController = MobileScannerController();

//   void _barcodeDetected(BarcodeCapture capture) async {
//     final barcodes = capture.barcodes;
//     for (final barcode in barcodes) {
//       final rawValue = barcode.rawValue ?? "";
//       // if (rawValue.length != 0) {
//       // final fnskuData = rawValue.substring(6);
//       // SharedPreferences prefs = await SharedPreferences.getInstance();
//       // await prefs.setString('scannedFNSKU', rawValue);
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text('Success'),
//           content: Text('FNSKU barcode scanned and saved.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//       break;
//       // }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan Screen'),
//         actions: [
//           IconButton(
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.torchState,
//               builder: (context, state, child) {
//                 switch (state) {
//                   case TorchState.off:
//                     return Icon(Icons.flash_off, color: Colors.grey);
//                   case TorchState.on:
//                     return Icon(Icons.flash_on, color: Colors.yellow);
//                 }
//               },
//             ),
//             onPressed: () => cameraController.toggleTorch(),
//           ),
//           IconButton(
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.cameraFacingState,
//               builder: (context, state, child) {
//                 switch (state) {
//                   case CameraFacing.front:
//                     return Icon(Icons.camera_front);
//                   case CameraFacing.back:
//                     return Icon(Icons.camera_rear);
//                 }
//               },
//             ),
//             onPressed: () => cameraController.switchCamera(),
//           ),
//         ],
//       ),
//       body: MobileScanner(
//         controller: cameraController,
//         onDetect: _barcodeDetected,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     cameraController.dispose();
//     super.dispose();
//   }
// }
