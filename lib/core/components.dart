import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:project/core/assets.dart';
import 'package:project/core/styles.dart';
import 'package:project/models/recycle_item.dart';
import 'package:project/models/recycle_process_item.dart';
import 'package:project/models/warehouse.dart';
import 'package:project/screens/-----For%20employe-----/home/provider/scan_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
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
}) =>
    Container(
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
                          color: item.status == "Done"
                              ? AppColor.mainDisabled
                              : AppColor.error,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(item.status,
                                style: TextStyle(
                                    color: item.status == "Done"
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 12)),
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

Widget RecycleItemBuilder(BuildContext context, RecycleItem item, int index) => Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Text("Category: ${item.category}"),
                Spacer(),
                Text("Count: ${item.count}"),
                Spacer(),
                Text(
                  "Points: ${item.totalPoints} pts",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<ScanProvider>().onDeleteItem(index);
                  },
                  child: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ))
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

Widget BulletListBuilder({
  required List<String> items,
  double fontSize = 16,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: items.map((item) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' • ', style: TextStyle(fontSize: fontSize + 5)), // Bullet point
          Expanded(
            child: Text(item, style: TextStyle(fontSize: fontSize)),
          ),
        ],
      );
    }).toList(),
  );
}

Widget CategoryItemBuilder({
  required String assetImage,
  required String label,
}){

  Color backgroundColor = label == "Plastic" ? Color.fromRGBO(255, 179, 0, 0.25)
      : label == "Can" ? Color.fromRGBO(0, 150, 136, 0.25)
      : label == "Glass" ? Color.fromRGBO(38, 70, 83, 0.25)
      : Color(0x40649014);

  Color IconColor = label == "Plastic" ? Color.fromRGBO(255, 179, 0, 1)
      : label == "Can" ? Color.fromRGBO(0, 150, 136, 1)
      : label == "Glass" ? Color.fromRGBO(38, 70, 83, 1)
      : Color(0x40649014);

  return Container(
    height: 15.h,
    width: 27.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor
    ),
    child: Center(
      child: Column(
        children: [
          Divider(height: 2.h, color: Colors.transparent),
          Image.asset(assetImage, width: 64, height: 64, color: IconColor,),
          Divider(height: 5.h, color: Colors.transparent),
          Text(label,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp)),
        ],
      ),
    ),
  );
}


Widget WarehouseItemBuilder({
  required Warehouse warehouse,
}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
  child: Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            warehouse.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          _buildStarRating(warehouse.rating),
          SizedBox(height: 12),
          InkWell(
            onTap: () => openMap(warehouse.location),
            child: Row(
              children: [
                Icon(Icons.map, color: Colors.blue),
                SizedBox(width: 6),
                Text(
                  'View on Map',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
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

Widget _buildStarRating(dynamic rating) {
  const totalStars = 5;
  final filledStars = rating.floor();
  final halfStar = rating - filledStars >= 0.5;

  return Row(
    children: List.generate(totalStars, (index) {
      if (index < filledStars) {
        return Icon(Icons.star, color: Colors.amber, size: 20);
      } else if (index == filledStars && halfStar) {
        return Icon(Icons.star_half, color: Colors.amber, size: 20);
      } else {
        return Icon(Icons.star_border, color: Colors.amber, size: 20);
      }
    }),
  );
}

void openMap(LatLng location) async {
  final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}');

  await launchUrl(url, mode: LaunchMode.externalApplication);

}