import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/core/assets.dart';
import 'package:project/core/components.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/notifications/notifications.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/store/store_category.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../-----For employe-----/home/components/category_examples/category_examples.dart' show CategoryExamples;
import '../../../../../core/app_routes.dart';

class Home_U_Main extends StatefulWidget {
  const Home_U_Main({super.key});

  @override
  State<Home_U_Main> createState() => _Home_U_MainState();
}

class _Home_U_MainState extends State<Home_U_Main> {

  final PageController _pageController = PageController();
  List<dynamic> bannersImages = [];

  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < bannersImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 1.h, color: Colors.transparent),
                  Row(
                    children: [
                      Image.asset(
                        Assets.logo,
                        scale: 3,
                      ),
                      VerticalDivider(width: 2.w, color: Colors.transparent),
                      Flexible(
                        child: Text(
                          "Welcome, ${context.watch<UserProvider>().state.myUser?.username ?? 'Guest'}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications_U()));
                          },
                          child: Icon(Iconsax.notification)
                      ),
                    ],
                  ),

                  // myElevatedButton(
                  //     label: "Test",
                  //     onPressed: () async {
                  //       await context
                  //           .read<UserProvider>()
                  //           .GetUserRecycleResults(
                  //               Provider.of<UserProvider>(context,
                  //                       listen: false)
                  //                   .state
                  //                   .myUser
                  //                   .globalID,
                  //               Provider.of<UserProvider>(context,
                  //                       listen: false)
                  //                   .state
                  //                   .myUser
                  //                   .localID);
                  //     }),
                  Divider(height: 3.h, color: Colors.transparent),

                  // Slider
                  StreamBuilder(
                      stream: GetAppBanners(),
                      builder: (context, snapshot){

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(child: Text("Error: ${snapshot.error}"));
                        }

                        bannersImages = snapshot.data!.docs.map((e) => e.get("imageUrl")).toList();

                        if(bannersImages.isEmpty){
                          return SizedBox(
                              height: 20.h,
                              child: Image.asset(
                                  Assets.homePanel1,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                              )
                          );
                        }
                        return SizedBox(
                          height: 20.h,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: bannersImages.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                bannersImages[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              );
                            },
                          ),
                        );
                      }
                  ),


                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              Assets.coins,
                              scale: 1.5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(context
                                .watch<UserProvider>()
                                .state
                                .myUser
                                .points
                                .toString()),
                            Text("Points"),
                          ],
                        ),
                        Container(
                          color: Colors.grey,
                          height: 88,
                          width: 1,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              Assets.bottle,
                              scale: 1.5,
                            ),
                            Text(context.watch<UserProvider>().state.myUser.plasticNumbers.toString()),
                            Text("Bottles"),
                          ],
                        ),
                        Container(
                          color: Colors.grey,
                          height: 88,
                          width: 1,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              Assets.can,
                              scale: 1.5,
                            ),
                            Text(context.watch<UserProvider>().state.myUser.canNumbers.toString()),
                            Text("Cans"),
                          ],
                        ),
                        Container(
                          color: Colors.grey,
                          height: 88,
                          width: 1,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              Assets.glass,
                              scale: 1.5,
                            ),
                            Text(context.watch<UserProvider>().state.myUser.glassNumbers.toString()),
                            Text("Glasses"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),

                  Text("Tools & Services",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18.sp)),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StoreCategory()));
                              },
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.orange[100],
                                child: Image.asset(
                                  Assets.coins,
                                  scale: 1.5,
                                  color: Colors.orange[800],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Store"),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  context.read<HomeProvider_U>().onNavigationTap(1);
                                });
                              },
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.cyan[100],
                                child: Image.asset(
                                  Assets.mapMarker,
                                  scale: 1.5,
                                  color: Colors.cyan[800],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Map"),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, App_Routes.scan_U);
                              },
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.blueGrey[100],
                                child: Image.asset(
                                  Assets.qrCode,
                                  scale: 1.5,
                                  color: Colors.blueGrey[800],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("QR Code"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Row(
                    children: [
                      Text("Categories",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp)),
                      Spacer(),
                      TextButton(onPressed: (){
                        context.read<HomeProvider_U>().onNavigationTap(3);
                      }, child: Text("See All")),
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryExamples(category: "Plastic")));
                        },
                        child: Container(
                          height: 15.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(255, 179, 0, 0.25),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Divider(height: 2.h, color: Colors.transparent),
                                Image.asset(
                                  Assets.bottle,
                                  scale: 1,
                                  color: Color.fromRGBO(255, 179, 0, 1),
                                ),
                                Divider(height: 1.h, color: Colors.transparent),
                                Text("Plastic",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryExamples(category: "Can")));
                        },
                        child: Container(
                          height: 15.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(0, 150, 136, 0.25),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Divider(height: 2.h, color: Colors.transparent),
                                Image.asset(
                                  Assets.can,
                                  scale: 1,
                                  color: Color.fromRGBO(0, 150, 136, 1),
                                ),
                                Divider(height: 1.h, color: Colors.transparent),
                                Text("Can",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryExamples(category: "Glass")));
                        },
                        child: Container(
                          height: 15.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(38, 70, 83, 0.25),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Divider(height: 2.h, color: Colors.transparent),
                                Image.asset(Assets.glass,
                                    scale: 1,
                                    color: Color.fromRGBO(38, 70, 83, 1)),
                                Divider(height: 1.h, color: Colors.transparent),
                                Text("Glass",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }

  Stream<QuerySnapshot> GetAppBanners(){
    return FirebaseFirestore.instance.collection("app_banners").snapshots();
  }

}

