import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '/controllers/qr_controller.dart';

class QRScanScreen extends GetView<QRScanController> {
  const QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QRScanController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scan Screen'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: QRView(
              key: controller.qrKey,
              onQRViewCreated: controller.onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.white,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: 70,
          //     color: Colors.white,
          //     child: const Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Icon(Icons.qr_code_scanner, size: 30),
          //         Text('Đang quét mã QR...'),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
