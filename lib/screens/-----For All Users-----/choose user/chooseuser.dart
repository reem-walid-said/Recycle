import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';

import 'package:sizer/sizer.dart';

class ChooseUser extends StatefulWidget {
  const ChooseUser({super.key});

  @override
  State<ChooseUser> createState() => _ChooseUserState();
}

class _ChooseUserState extends State<ChooseUser> {

  String? _localModelPath;

  @override
  void initState() {
    super.initState();
    _downloadModel();
  }

  Future<void> _downloadModel() async {
    try {
      final customModel = await FirebaseModelDownloader.instance.getModel(
        "model.onnx",
        FirebaseModelDownloadType.localModel,
        FirebaseModelDownloadConditions(
          iosAllowsCellularAccess: true,
          iosAllowsBackgroundDownloading: false,
          androidChargingRequired: false,
          androidWifiRequired: false,
          androidDeviceIdleRequired: false,
        ),
      );

      setState(() {
        _localModelPath = customModel.file.path;
      });

      // Now you can use the model with TensorFlow Lite
      _initializeInterpreter();
    } catch (e) {
      print("Failed to download model: $e");
    }
  }

  void _initializeInterpreter() {
    if (_localModelPath != null) {
      // Initialize TensorFlow Lite interpreter with the model
      // Example:
      // var interpreter = Interpreter.fromFile(File(_localModelPath!));
      // Use the interpreter for inference
    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     InkWell(
          //         onTap: () {
          //           Navigator.pushNamed(context, App_Routes.onboardingmain);
          //         },
          //         child: Icon(Iconsax.arrow_left)),
          //   ],
          // ),
          SizedBox(
            height: 7.h,
          ),
          Image.asset(
            Assets.logo,
            scale: 5.sp,
          ),
          Divider(
            color: Colors.transparent,
            height: 1.h,
          ),
          Text("Select User Type",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Text("You Can Select User Type To Continue ",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromARGB(255, 40, 40, 40))),
          Text("Sign Up Flow",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromARGB(255, 40, 40, 40))),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, App_Routes.login_U);
                  },
                  child: Container(
                    height: 22.h,
                    width: 43.w,
                    decoration: BoxDecoration(
                      color: Color(0x40649014),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 2.h),
                        Image.asset(
                          Assets.user,
                          scale: 1.3,
                        ),
                        Text("User",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, App_Routes.login_E);
                  },
                  child: Container(
                    height: 22.h,
                    width: 43.w,
                    decoration: BoxDecoration(
                      color: Color(0x40649014),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 2.h),
                        Image.asset(
                          Assets.employee,
                          scale: 1.3,
                        ),
                        Text("Employee",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
