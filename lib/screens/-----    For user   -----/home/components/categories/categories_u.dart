import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/screens/-----For%20employe-----/home/components/category_examples/category_examples.dart';

import '../../../../../core/constants.dart';

class Categories_U extends StatefulWidget {
  const Categories_U({super.key});

  @override
  State<Categories_U> createState() => _Categories_UState();
}

class _Categories_UState extends State<Categories_U> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryExamples(category: myCategories[index].key)));
            },
            child: CategoryItemBuilder(
                label: myCategories[index].key,
                assetImage: myCategories[index].value,
            ),
          ),
          itemCount: myCategories.length,
        ),
      ),
    );
  }
}
