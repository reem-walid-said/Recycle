import 'package:flutter/material.dart';
import 'package:pair/pair.dart';
import 'package:project/core/components.dart';
import 'package:project/core/constants.dart';

import '../../../../../core/assets.dart';

class Categories_E extends StatefulWidget {
  const Categories_E({super.key});

  @override
  State<Categories_E> createState() => _Categories_EState();
}

class _Categories_EState extends State<Categories_E> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => CategoryItemBuilder(
                label: myCategories[index].key,
                assetImage: myCategories[index].value
            ),
            itemCount: myCategories.length,
        ),
      ),
    );
  }
}
