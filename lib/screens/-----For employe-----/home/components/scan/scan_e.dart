import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/components.dart';
import 'package:project/core/styles.dart';
import 'package:project/screens/-----For%20employe-----/home/components/scanned_items/scanned_items.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/scan_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/assets.dart';

class Scan_E extends StatefulWidget {
  const Scan_E({super.key});

  @override
  State<Scan_E> createState() => _Scan_EState();
}

class _Scan_EState extends State<Scan_E> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          Assets.logo,
          scale: 2,
        ),
        title: Text("Scan",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 20.sp)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScannedItemsScreen()));
              }, icon: Icon(Icons.shopping_cart)
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    myTextFormField(
                        hintText: "Item's Name",
                        controller: context.watch<ScanProvider>().state.itemNameController,
                    ),


                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text("Choose the category"),
                        Spacer(),
                        DropdownMenu(
                          controller: context.watch<ScanProvider>().state.dropDownMenuController,
                          dropdownMenuEntries: context.watch<ScanProvider>().state.myCategories,
                          onSelected: context.read<ScanProvider>().onCategoryChange,
                        ),
                      ],
                    ),


                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text("Choose the number"),
                        Spacer(),

                        Container(
                          width: 50,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.error,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(onPressed: (){
                            context.read<ScanProvider>().onNumberDecrease();
                          }, icon: Icon(Icons.remove, color: Colors.white,)),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(context.watch<ScanProvider>().state.selectedNumber.toString(), style: TextStyle(fontSize: 20),),
                        ),

                        Container(
                          width: 50,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.main,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(onPressed: (){
                            context.read<ScanProvider>().onNumberIncrease();
                          }, icon: Icon(Icons.add, color: Colors.white,)),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Center(
                      child: ElevatedButton(
                          onPressed: (){
                            context.read<ScanProvider>().onAddingItem();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.main
                          ),
                          child: Text("Add", style: TextStyle(color: Colors.white),),
                      ),
                    ),

                  ],
                ),
              ))),
    );
  }
}
