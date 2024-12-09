import 'package:flutter/material.dart';

class Scan_U extends StatefulWidget {
  const Scan_U({super.key});

  @override
  State<Scan_U> createState() => _Scan_UState();
}

class _Scan_UState extends State<Scan_U> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.qr_code_scanner)),
              Text('Scan_U'),
            ],
          ),
        ),
      ),
    );
  }
}
