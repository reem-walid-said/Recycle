import 'package:flutter/material.dart';
import 'package:project/core/Assets.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/store/store_items.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/store_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/components.dart';

class StoreCategory extends StatelessWidget {
  const StoreCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
        centerTitle: true,
        actions: [
          Image.asset(Assets.logo),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  Provider.of<StoreProvider>(context, listen: false).changeCategory(Provider.of<StoreProvider>(context, listen: false).state.storeCategories[index]);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StoreItems()));
                },
                child: StoreCategoryBuilder(Provider.of<StoreProvider>(context).state.storeCategories[index]),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 30,),
            itemCount: Provider.of<StoreProvider>(context).state.storeCategories.length
        ),
      ),
    );
  }
}
