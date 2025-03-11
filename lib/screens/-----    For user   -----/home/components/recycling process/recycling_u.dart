import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/models/recycle_process_item.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/assets.dart';

class Recycling_U extends StatefulWidget {
  const Recycling_U({super.key});

  @override
  State<Recycling_U> createState() => _Recycling_UState();
}

class _Recycling_UState extends State<Recycling_U> {
  var SearchController = TextEditingController();

  List<RecycleProcessItem> myList = [];

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
        body: StreamBuilder(
            stream:
                myRecycleProcess(context.watch<UserProvider>().state.myUser.localID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }

              myList = snapshot.data!.docs
                  .map((e) => RecycleProcessItem.fromJson(
                      e as DocumentSnapshot<Object?>))
                  .toList();

              myList = List.from(myList.reversed);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myTextFormField(
                      hintText: "Search",
                      controller: SearchController,
                      prefixIcon: Icons.search),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your Last recycling Processes",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: myList.isNotEmpty,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            myRecyclingProcessItem(item: myList[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        itemCount: myList.length,
                        shrinkWrap: true,
                      ),
                    ),
                    fallback: (context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage(
                                Assets.recyclingProcessEmptyBackground)),
                        SizedBox(
                          height: 50,
                        ),
                        Text("Ops....",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400)),
                        Text(
                          "No Recycling Processes yet",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Stream<QuerySnapshot> myRecycleProcess(String userId) {
    return FirebaseFirestore.instance
        .collection("recycle_process")
        .where("uid", isEqualTo: userId)
        .snapshots();
  }
}
