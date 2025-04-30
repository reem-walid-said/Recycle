import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/core/styles.dart';
import 'package:project/screens/-----For%20employe-----/home/components/scanned_items/scanned_items.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/model_provider.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/scan_provider.dart';
import 'package:provider/provider.dart';

import '../scan/scan_e.dart';

class ScanWithModel extends StatelessWidget {
  const ScanWithModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Scan"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Scan_E()));
              },
              icon: Icon(Icons.change_circle_outlined)),


          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScannedItemsScreen()));
              },
              icon: Icon(Icons.shopping_cart)),


        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: AppColor.mainDark,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Make sure the item is centered before capturing.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )),
                SizedBox(height: 20),
                context.watch<ModelProvider>().state.selectedImage != null
                    ? Image.file(
                        context.watch<ModelProvider>().state.selectedImage!,
                        width: 300,
                        height: 450,
                        fit: BoxFit.cover)
                    : Text('No image selected', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: context.watch<ModelProvider>().pickImageFromGallery,
                      icon: Icon(Icons.image_outlined, color: Colors.white,),
                      label: Text('Browse Gallery', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple
                      ),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton.icon(
                      onPressed: context.watch<ModelProvider>().pickImageFromCamera,
                      icon: Icon(Icons.camera, color: Colors.white,),
                      label: Text('Take Photo', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                context.watch<ModelProvider>().state.selectedImage != null
                    ? myElevatedButton(
                        label: "Check",
                        onPressed: () async {
                          showBottomSheet(context);
                          await context.read<ModelProvider>().runInference();
                        })
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        if (context.watch<ModelProvider>().state.selectedImageCategoryResult ==
            null) {
          return CircularProgressIndicator(
            color: AppColor.main,
          );
        } else {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Scanning Result',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Image.file(context.watch<ModelProvider>().state.selectedImage!,
                    width: 124, height: 180,fit: BoxFit.cover),
                SizedBox(height: 10),
                Text(
                  "Item Category: ${context.watch<ModelProvider>().state.selectedImageCategoryResult}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.read<ModelProvider>().decreaseCount();
                        },
                        icon: Icon(Icons.remove)),
                    Text(
                      "${context.watch<ModelProvider>().state.selectedImageCount}x",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<ModelProvider>().increaseCount();
                        },
                        icon: Icon(Icons.add)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: myElevatedButton(
                          label: "Cancel",
                          backgroundColor: AppColor.error,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: myElevatedButton(
                            label: "Add",
                            onPressed: () {
                              context.read<ScanProvider>().onAddingItemNew(
                                  category: Provider.of<ModelProvider>(context, listen: false).state
                                      .selectedImageCategoryResult!,
                                  count: Provider.of<ModelProvider>(context, listen: false).state
                                      .selectedImageCount);

                              Navigator.pop(context);
                              context.read<ModelProvider>().reset();
                            })),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
