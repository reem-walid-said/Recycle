import 'package:flutter/material.dart';
import 'package:project/core/components.dart';

import '../../../../../core/constants.dart';

class Categories_U extends StatefulWidget {
  const Categories_U({super.key});

  @override
  State<Categories_U> createState() => _Categories_UState();
}

class _Categories_UState extends State<Categories_U> {
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
