import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/core/styles.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
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
                      Text("Total Plastic Items:", style: TextStyle(fontSize: 20),),
                      Spacer(),
                      Text(
                        "${context.watch<ScanProvider>().state.totalScannedPlasticItems}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Total Can Items:", style: TextStyle(fontSize: 20),),
                      Spacer(),
                      Text(
                        "${context.watch<ScanProvider>().state.totalScannedCanItems}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Total Glass Items:", style: TextStyle(fontSize: 20),),
                      Spacer(),
                      Text(
                        "${context.watch<ScanProvider>().state.totalScannedGlassItems}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
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
                  SizedBox(height: 50,),
                  ConditionalBuilder(
                      condition: context.watch<ScanProvider>().state.onConfirming,
                      builder: (context) => CircularProgressIndicator(color: AppColor.main,),
                      fallback: (context) => myElevatedButton(
                          label: "Confirm",
                          onPressed: () async {
                            //print(Provider.of<UserProvider>(context, listen: false).state.myUser?.id);
                            await context.read<ScanProvider>().onConfirmOrder(employeeId:Provider.of<UserProvider>(context, listen: false).state.myUser!.localID);
                            Navigator.pop(context); // back to scan items screen
                            Navigator.pop(context); // back to scan profile screen
                            Navigator.pop(context); // back to home screen
                          }
                      )
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
