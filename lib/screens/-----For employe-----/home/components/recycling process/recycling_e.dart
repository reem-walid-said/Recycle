import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/core/styles.dart';
import 'package:project/models/recycle_process_item.dart';

import '../../../../../core/assets.dart';

class Recycling_E extends StatefulWidget {
  const Recycling_E({super.key});

  @override
  State<Recycling_E> createState() => _Recycling_EState();
}

class _Recycling_EState extends State<Recycling_E> {

  var SearchController = TextEditingController();

  List<RecycleProcessItem> myList = [
    // RecycleProcessItem(dateTime: DateTime(2024, 12, 16, 3, 36), status: true, points: 1000, user: "Zyad1226"),
    // RecycleProcessItem(dateTime: DateTime(2024, 12, 16, 3, 36), status: false, points: 1000, user: "Samy1226"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Recycling Process"),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {},
                child: Image(
                  image: AssetImage(Assets.filterIcon),
                  width: 24,

                )),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myTextFormField(hintText: "Search", controller: SearchController, prefixIcon: Icons.search),
            SizedBox(height: 10,),
            Text(
                "Your Last recycling Processes",
                style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20,),

            ConditionalBuilder(
                condition: myList.isNotEmpty,
                builder: (context) => Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => myRecyclingProcessItem(item: myList[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 20,),
                    itemCount: myList.length,
                    shrinkWrap: true,
                  ),
                ),
                fallback: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(Assets.recyclingProcessEmptyBackground)),
                    SizedBox(height: 50,),
                    Text("Ops....", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                    Text("No Recycling Processes yet", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                  ],
                ),
            ),


          ],
        ),
      ),
    );
  }
}
