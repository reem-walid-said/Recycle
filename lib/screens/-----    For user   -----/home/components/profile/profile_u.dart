import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/components.dart';
import 'package:project/core/styles.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/settings/settings_u.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/login/login_U.dart';
import 'package:project/screens/-----For%20All%20Users-----/FAQ/FAQ.dart';
import 'package:project/screens/-----For%20All%20Users-----/choose%20user/chooseuser.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/register/provider/register_provder.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/assets.dart';

class Profile_U extends StatefulWidget {
  const Profile_U({super.key});

  @override
  State<Profile_U> createState() => _Profile_UState();
}

class _Profile_UState extends State<Profile_U> {
  TextEditingController EditNameController = TextEditingController();
  TextEditingController EditEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () async {
                  await context.read<UserProvider>().GetUserData(id: Provider.of<UserProvider>(context, listen: false).state.myUser.globalID);
                },
                icon: Icon(Icons.refresh),
            ),
            title: const Text("Account"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  )),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.watch<UserProvider>().state.myUser!.username,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        context.watch<UserProvider>().state.myUser!.email,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: () {
                    editDialog();
                  }, icon: Icon(Icons.edit_outlined)),
                ],
              ),

              SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, App_Routes.scan_U);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.mainDisabled,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            children: [
                              Icon(Icons.qr_code),
                              Text(
                                "QR-Code",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.mainDisabled,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          children: [
                            //Text("You have", style: TextStyle(color: Colors.white, fontSize: 26),),
                            Text(
                              "${context.watch<UserProvider>().state.myUser!.points}",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Points",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10,),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings_U_Screen()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 24,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Setting",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Settings_U_Screen()));
                    }, icon: Icon(Icons.arrow_forward_ios_rounded)),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));
                },
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(Assets.FAQIcon),
                      width: 30,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "FAQ's",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));
                    }, icon: Icon(Icons.arrow_forward_ios_rounded)),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              GestureDetector(
                onTap: () async {
                  await context.read<UserProvider>().LogOut();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ChooseUser()), (route) => false);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      size: 24,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_rounded)),
                  ],
                ),
              ),
              SizedBox(height: 10,),


            ],
          ),
        ),
      );
  }

  Future editDialog() async {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColor.background,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Text("Edit", style: TextStyle(fontSize: 24),)),
                SizedBox(height: 30,),
                myTextFormField(label: "Name", hintText: "Enter Name", controller: EditNameController, prefixIcon: Icons.person_outline_outlined),
                SizedBox(height: 20),
                myTextFormField(label: "Email", hintText: "Enter Email", controller: EditEmailController, prefixIcon: Icons.email_outlined),
                SizedBox(height: 20),

                Text("Phone Number", style: TextStyle(fontSize: 18),),
                Container(
                  padding: EdgeInsets.all(1.w),
                  margin: EdgeInsets.only(bottom: 2.h),
                  alignment: Alignment.center,
                  height: 8.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 4.sp, color: Colors.grey)),
                  child: InternationalPhoneNumberInput(
                    keyboardType: TextInputType.number,
                    onSaved:
                    context.read<CreateAccountProvider>().onPhoneNumberChange,
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                    ignoreBlank: true,
                    onInputChanged:
                    context.read<CreateAccountProvider>().onPhoneNumberChange,
                    inputBorder: InputBorder.none,
                  ),
                ),
                Spacer(),
                myElevatedButton(
                  label: "Done", onPressed: (){
                  Navigator.pop(context);
                },
                )

              ],
            ),
          ),
        ),



      ),
    );
  }

}
