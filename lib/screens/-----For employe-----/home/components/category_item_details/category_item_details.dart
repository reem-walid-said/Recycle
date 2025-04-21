import 'package:flutter/material.dart';
import 'package:project/models/category_example_item.dart';

class CategoryItemDetails extends StatelessWidget {
  final CategoryExampleItem item;
  const CategoryItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.center,
                    child: Image.network(item.image, height: 300,)),

                SizedBox(height: 20,),

                Text(item.name, style: TextStyle(fontSize: 24),),
                SizedBox(height: 10,),
                Text(item.size, style: TextStyle(color: Colors.grey, fontSize: 16),),
                SizedBox(height: 10,),
                Text("Description: ", style: TextStyle(fontSize: 24),),
                SizedBox(height: 10,),
                Text(item.description, style: TextStyle(fontSize: 18),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
