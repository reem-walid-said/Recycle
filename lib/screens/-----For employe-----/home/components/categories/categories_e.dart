import 'package:flutter/material.dart';
import 'package:pair/pair.dart';
import 'package:project/core/components.dart';
import 'package:project/core/constants.dart';

import '../../../../../core/assets.dart';
import '../category_examples/category_examples.dart';

class Categories_E extends StatefulWidget {
  const Categories_E({super.key});

  @override
  State<Categories_E> createState() => _Categories_EState();
}

class _Categories_EState extends State<Categories_E> {

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
