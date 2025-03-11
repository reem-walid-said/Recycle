import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/nav_bar/nav_bar.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:project/screens/-----For%20employe-----/home/components/nav_bar/nav_bar.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';

class Home_E extends StatefulWidget {
  const Home_E({super.key});

  @override
  State<Home_E> createState() => _Home_EState();
}

class _Home_EState extends State<Home_E> {

  // String? _localModelPath;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _downloadModel();
  // }
  //
  // Future<void> _downloadModel() async {
  //   try {
  //     final customModel = await FirebaseModelDownloader.instance.getModel(
  //       "model.onnx",
  //       FirebaseModelDownloadType.localModel,
  //       FirebaseModelDownloadConditions(
  //         iosAllowsCellularAccess: true,
  //         iosAllowsBackgroundDownloading: false,
  //         androidChargingRequired: false,
  //         androidWifiRequired: false,
  //         androidDeviceIdleRequired: false,
  //       ),
  //     );
  //
  //     setState(() {
  //       _localModelPath = customModel.file.path;
  //     });
  //
  //     // Now you can use the model with TensorFlow Lite
  //     _initializeInterpreter();
  //   } catch (e) {
  //     print("Failed to download model: $e");
  //   }
  // }
  //
  // void _initializeInterpreter() {
  //   if (_localModelPath != null) {
  //     // Initialize TensorFlow Lite interpreter with the model
  //     // Example:
  //     // var interpreter = Interpreter.fromFile(File(_localModelPath!));
  //     // Use the interpreter for inference
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<HomeProvider_E>().chosenPage(),
        bottomNavigationBar: const BottomNavBar_E()
    );
  }
}
