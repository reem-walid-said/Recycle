import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:project/core/components.dart';
import 'package:project/core/styles.dart';
import 'package:project/screens/-----For%20employe-----/home/components/scan/scan_e.dart';
import 'package:project/screens/-----For%20employe-----/home/components/scan_model/scan_model.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/model_provider.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/scan_provider.dart';
import 'package:provider/provider.dart';

class ScanProfile extends StatefulWidget {
  const ScanProfile({super.key});

  @override
  State<ScanProfile> createState() => _ScanProfileState();
}

class _ScanProfileState extends State<ScanProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Scan"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<ScanProvider>().ResetScannedId();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              controller: context.watch<ScanProvider>().state.cameraController,
              onDetect: (capture) async {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  dynamic result = await context
                      .read<ScanProvider>()
                      .onScanID(barcode.rawValue);
                  if (result == false) {
                    _showBottomSheetFaild(context);
                  } else {
                    _showBottomSheetSuccess(context);
                  }
                  break; // Stop after the first barcode is detected
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheetSuccess(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'QR Code Scanned Successfully!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.mainDark,
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context
                            .watch<ScanProvider>()
                            .state
                            .scannedUser!
                            .username,
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        context.watch<ScanProvider>().state.scannedUser!.email,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600]
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${context.watch<ScanProvider>().state.scannedUser!.points}pts",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              myElevatedButton(
                  label: "Confirm",
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScanWithModel()));
                    //context.read<ScanProvider>().onConfirmScan();

                  }),
            ],
          ),
        );
      },
    );
  }

  void _showBottomSheetFaild(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'User not Found',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Icon(
                Icons.error,
                color: Colors.red,
                size: 60,
              ),
              SizedBox(height: 20),
              myElevatedButton(
                label: "Try again",
                backgroundColor: AppColor.error,
                onPressed: () {
                  context.read<ScanProvider>().ResetScannedId();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
