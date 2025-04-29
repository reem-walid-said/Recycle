import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/core/styles.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/store_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/assets.dart';
import '../../provider/user_provider.dart';

class StoreItems extends StatefulWidget {
  const StoreItems({super.key});

  @override
  State<StoreItems> createState() => _StoreItemsState();
}

class _StoreItemsState extends State<StoreItems> {
  final formKey = GlobalKey<FormState>();

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
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.mainDisabled,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Provider.of<UserProvider>(context).state.myUser.points.toString()),
                          SizedBox(width: 10,),
                          Image.asset(Assets.coins, scale: 2,),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: (){
                            Provider.of<StoreProvider>(context, listen: false).changeCategory(Provider.of<StoreProvider>(context, listen: false).state.storeCategories[index]);
                          },
                          child: StoreCategoryBuilder2(Provider.of<StoreProvider>(context, listen: false).state.storeCategories[index], Provider.of<StoreProvider>(context).state.selectedCategory!)
                      ),
                      separatorBuilder: (context, index) => SizedBox(width: 10,),
                      itemCount: Provider.of<StoreProvider>(context, listen: false).state.storeCategories.length,
                      scrollDirection: Axis.horizontal,
                  ),
                ),

                SizedBox(height: 20,),

                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: (){
                          Provider.of<StoreProvider>(context, listen: false).changeItem(Provider.of<StoreProvider>(context, listen: false).state.storeItems[index].name);
                        },
                        child: StoreItemBuilder(Provider.of<StoreProvider>(context).state.storeItems[index], Provider.of<StoreProvider>(context).state.selectedCategory!, Provider.of<StoreProvider>(context).state.selectedItem)
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 10,),
                    itemCount: Provider.of<StoreProvider>(context).state.storeItems.where((item) => item.category == Provider.of<StoreProvider>(context).state.selectedCategory!.name).length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                    decoration: BoxDecoration(
                      color: Provider.of<StoreProvider>(context).state.isItemSelected ? AppColor.main : Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(Provider.of<StoreProvider>(context).state.selectedItem, style: TextStyle(color: Colors.white),),
                    ),
                ),

                SizedBox(height: 20,),


                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[600] as Color),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    controller: Provider.of<StoreProvider>(context).state.enteredPoints,
                    decoration: InputDecoration(
                      hintText: "Enter Your Point Number",
                      hintStyle: TextStyle(color: Colors.grey,),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return "The value should not be Empty";
                      }
                      int? points = int.tryParse(value);
                      if(points == null){
                        return "The value should be an Integer";
                      }
                      if(points < 1){
                        return "The value should be greater than 0";
                      }

                      return null;
                    },
                  ),
                ),
                Text("1 Points = 0.5 L.E", style: TextStyle(color: Colors.grey[700]),),

                SizedBox(height: 100,),

                myElevatedButton(
                    label: "Request",
                    onPressed: () async {
                      if(formKey.currentState!.validate() == false){
                        print("Invalid Request");
                        return;
                      }
                      bool? result = await Provider.of<StoreProvider>(context, listen: false).requestStoreItem(
                        userId: Provider.of<UserProvider>(context, listen: false).state.myUser.globalID,
                        userPoints: Provider.of<UserProvider>(context, listen: false).state.myUser.points,
                      );

                      if(result == true){
                        Provider.of<UserProvider>(context, listen: false).GetUserData(id: Provider.of<UserProvider>(context, listen: false).state.myUser.globalID);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
