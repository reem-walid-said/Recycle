import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:project/core/assets.dart';
import 'package:project/core/styles.dart';
import 'package:project/models/recycle_item.dart';
import 'package:project/models/recycle_process_item.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/scan_provider.dart';
import 'package:provider/provider.dart';
// Here will be all the Shared Components like (Buttons, Item's Designs, etc...)

Widget myElevatedButton({
  required String label,
  required VoidCallback onPressed,
  Color? backgroundColor,
}) =>
    SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.main,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );

Widget myTextFormField({
  String? label,
  required String hintText,
  required TextEditingController controller,
  IconData? prefixIcon,
}) =>
    Column(
      children: [
        Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              label ?? "",
              style: TextStyle(
                fontSize: 18,
              ),
            )),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 12),
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );

Widget myRecyclingProcessItem({
  required RecycleProcessItem item,
}) => Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Image(
              image: AssetImage(Assets.sign_at),
              width: 32,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.points}Pts",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "@${item.username}",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        width: 75,
                        decoration: BoxDecoration(
                          color: item.status == "Done" ? AppColor.mainDisabled : AppColor.error,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                item.status,
                                style: TextStyle(
                                    color: item.status == "Done" ? Colors.black : Colors.white, fontSize: 12)),
                          ),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Image(
                          image: AssetImage(Assets.arrowDown),
                          width: 24,
                        )),
                  ],
                ),
                Text(DateFormat("dd MMM yyyy").format(item.dateTime)),
                Text(DateFormat("hh:mm a").format(item.dateTime)),
              ],
            )
          ],
        ),
      ),
    );


Widget RecycleItemBuilder(BuildContext context, RecycleItem item) => Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey, width: 2),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${item.name}", style: TextStyle(fontSize: 22),),
        Row(
          children: [
            Text("Category: ${item.category.type}"),
            Spacer(),
            Text("Count: ${item.count}"),
            Spacer(),
            Text("Points: ${item.totalPoints} pts", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
          ],
        ),
        SizedBox(height: 10,),
        Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                onPressed: (){
                  context.read<ScanProvider>().onDeleteItem(item);
                },
                child: Icon(Icons.delete_forever_outlined, color: Colors.white, size: 30,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
            )
        )
      ],
    ),
  ),
);


Future myToast({
  String message = "",
  Color backgroundColor = Colors.red,
  int timeInSec = 3,
}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    timeInSecForIosWeb: timeInSec,
    fontSize: 16,
  );
}