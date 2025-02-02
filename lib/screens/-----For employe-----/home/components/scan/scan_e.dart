import 'package:flutter/material.dart';

class Scan_E extends StatefulWidget {
  const Scan_E({super.key});

  @override
  State<Scan_E> createState() => _Scan_EState();
}

class _Scan_EState extends State<Scan_E> {
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
              Text('Scan_E'),
            ],
          ),
        ),
      ),
    );
  }
}
