import 'package:flutter/material.dart';
import 'package:project/core/constants.dart';
import 'package:project/models/category_example_item.dart';
import 'package:project/screens/-----For%20employe-----/home/components/category_item_details/category_item_details.dart';

class CategoryExamples extends StatelessWidget {
  final String category;
  const CategoryExamples({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<CategoryExampleItem> myItems =
        AllItems.where((test) => test.category == category).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10,),
          itemBuilder: (context, index) {
            CategoryExampleItem item = myItems[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryItemDetails(item: item)));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(item.image, width: 150, height: 150,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: TextStyle(fontSize: 18, color: Colors.black),),
                            Text(item.size, style: TextStyle(fontSize: 12, color: Colors.grey),),
                            Text(item.description, style: TextStyle(fontSize: 14, color: Colors.black), maxLines: null,),
                            SizedBox(height: 20,),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.green,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text("Recycled"),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: myItems.length,
        ),
      ),
    );
  }
}
