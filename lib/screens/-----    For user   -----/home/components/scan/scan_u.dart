import 'package:flutter/material.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/assets.dart';

class Scan_U extends StatefulWidget {
  const Scan_U({super.key});

  @override
  State<Scan_U> createState() => _Scan_UState();
}

class _Scan_UState extends State<Scan_U> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            QrImageView(
                data: context.watch<UserProvider>().state.myUser!.id,
                version: QrVersions.auto,
            ),
            SizedBox(height: 30,),
            Text(
                "Scan this code before checking your items.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
            ),
          ],
        ),
      ),
    );
  }
}
