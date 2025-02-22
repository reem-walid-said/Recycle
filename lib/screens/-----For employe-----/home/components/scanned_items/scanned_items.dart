import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/scan_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/assets.dart';

class ScannedItemsScreen extends StatelessWidget {
  const ScannedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          Assets.logo,
          scale: 2,
        ),
        title: Text("Scanned Items",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConditionalBuilder(
            condition: context.watch<ScanProvider>().state.myScannedItem.isNotEmpty,
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    itemBuilder: (context, index) => RecycleItemBuilder(context, context.watch<ScanProvider>().state.myScannedItem[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemCount: context.watch<ScanProvider>().state.myScannedItem.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Text("Total Points:", style: TextStyle(fontSize: 20),),
                      Spacer(),
                      Text(
                        "${context.watch<ScanProvider>().state.totalScannedItemsPoints.toString()} pts",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.green),
                      ),
                    ],
                  ),
                  myElevatedButton(
                      label: "Confirm",
                      onPressed: (){
                        context.read<ScanProvider>().onConfirmOrder();
                        Navigator.pop(context); // back to scan items screen
                        Navigator.pop(context); // back to scan profile screen
                        Navigator.pop(context); // back to home screen
                      }
                  ),
                ],
              ),
            ),
            fallback: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(Assets.recyclingProcessEmptyBackground)),
                SizedBox(height: 50,),
                Text("No Scanned Item", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Add items")
                )
              ],
            ),
        ),
      ),
    );
  }
}
