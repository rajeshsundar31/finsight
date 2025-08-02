import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:finsight/presentation/amount/amount.dart' show AmountPay;
import 'package:flutter/material.dart';

class ScanCode extends StatefulWidget {
  const ScanCode({super.key});

  @override
  State<ScanCode> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  late String? name = '', upiId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AiBarcodeScanner(
          controller: MobileScannerController(
            formats: [BarcodeFormat.qrCode]
          ),
          validator: (value) {
            return value.barcodes.first.rawValue?.contains("@") ?? false;
          },
          onDetect: (BarcodeCapture capture) {
            String upiUrl = capture.barcodes.first.rawValue.toString();
            Uri uri = Uri.parse(upiUrl);

            upiId = uri.queryParameters['pa'];
            name = uri.queryParameters['pn'];
            Navigator.push(context, MaterialPageRoute(builder:(context) => AmountPay(title: name.toString(), upiId: upiId.toString()),));
            
          },
        ),
      ),
    );
  }
}