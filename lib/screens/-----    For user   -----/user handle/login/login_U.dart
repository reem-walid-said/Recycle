// ignore_for_file: prefer_const_constructors, camel_case_types, file_names
import 'package:iconsax/iconsax.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/core/app_routes.dart';
import 'package:project/core/assets.dart';
import 'package:project/core/components.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/login/provider/login_U_provider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/register/register_U.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Login_U extends StatefulWidget {
  const Login_U({super.key});

  @override
  State<Login_U> createState() => Login_UState();
}

class Login_UState extends State<Login_U> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //       child: Text("Sing In",
      //           style:
      //               TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp))),
      //   actions: [],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Iconsax.arrow_left)),
                    Text("Sign in ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20.sp)),
                    Image.asset(
                      Assets.user,
                      scale: 4,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.logo, scale: 5.sp),
                  ],
                ),
                SizedBox(height: 5.sp), // مسافة بين الـ AppBar وأول عنصر
                //////////////////////////// Email////////////////////////////
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  //height: 6.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1.sp,
                          color:
                              context.watch<Login_U_Provider>().state.email ==
                                      null
                                  ? Colors.grey
                                  : context
                                              .watch<Login_U_Provider>()
                                              .state
                                              .emailErrorMessage !=
                                          null
                                      ? Colors.red
                                      : Colors.green)),
                  child: TextField(
                    controller:
                        context.read<Login_U_Provider>().state.emailController,
                    onChanged:
                        context.read<Login_U_Provider>().onEmailChange,
                    onSubmitted:
                        context.read<Login_U_Provider>().onEmailChange,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.sms),
                      prefixIconColor:
                          context.watch<Login_U_Provider>().state.email == null
                              ? Colors.grey
                              : context
                                          .watch<Login_U_Provider>()
                                          .state
                                          .emailErrorMessage !=
                                      null
                                  ? Colors.red
                                  : Colors.green,
                      border: OutlineInputBorder().scale(3),
                      errorText: context.watch<Login_U_Provider>().state.emailErrorMessage
                    ),
                  ),
                ),
                SizedBox(height: 25.sp),
                //////////////////////////// Password////////////////////////////
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  //height: 6.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1.sp,
                        color:
                            context.watch<Login_U_Provider>().state.password ==
                                    null
                                ? Colors.grey
                                : context
                                            .watch<Login_U_Provider>()
                                            .state
                                            .passwordErrorMessage !=
                                        null
                                    ? Colors.red
                                    : Colors.green),
                  ),
                  child: TextField(
                    obscureText:
                        context.watch<Login_U_Provider>().state.hidePass,
                    controller: context
                        .read<Login_U_Provider>()
                        .state
                        .passwordController,
                    onChanged:
                        context.read<Login_U_Provider>().onPasswordChange,
                    onSubmitted:
                        context.read<Login_U_Provider>().onPasswordChange,
                    style: TextStyle(fontSize: 14.sp),
                    decoration: InputDecoration(
                        border: OutlineInputBorder().scale(3),
                        hintText: "Password",
                        prefixIcon: const Icon(
                          Iconsax.lock,
                        ),
                        prefixIconColor:
                            context.watch<Login_U_Provider>().state.password ==
                                    null
                                ? Colors.grey
                                : context
                                            .watch<Login_U_Provider>()
                                            .state
                                            .passwordErrorMessage !=
                                        null
                                    ? Colors.red
                                    : Colors.green,
                        suffixIcon: IconButton(
                          onPressed: () =>
                              context.read<Login_U_Provider>().showPassword(),
                          icon: context
                                      .watch<Login_U_Provider>()
                                      .state
                                      .hidePass ==
                                  true
                              ? const Icon(Iconsax.eye_slash4)
                              : const Icon(Iconsax.eye3),
                        ),
                        errorText: context.watch<Login_U_Provider>().state.passwordErrorMessage
                    ),
                  ),
                ),
                SizedBox(height: 20.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateColor.resolveWith((states) {
                              return context
                                      .watch<Login_U_Provider>()
                                      .state
                                      .rememberMe
                                  ? Colors.green
                                  : Colors.white;
                            }),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: context
                                .watch<Login_U_Provider>()
                                .state
                                .rememberMe,
                            onChanged: context
                                .read<Login_U_Provider>()
                                .onChangeRememberMe),
                        Text('Remember Me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, App_Routes.forget_U);
                      },
                      child: Text('Forget Password?'),
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),
                InkWell(
                  onTap: () async {

                    if(context.read<Login_U_Provider>().validate()){
                      print("VALID");
                      dynamic LoginResult = await context.read<Login_U_Provider>().Login(context);
                      if(LoginResult is String){

                        bool getDataResult = await context.read<UserProvider>().GetUserData(id: LoginResult);

                        if(getDataResult == true){
                          await myToast(
                            message: "Logged In Successfully",
                            backgroundColor: Colors.green,
                          );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            App_Routes.home_U,
                                (route) => false,
                          );
                        }
                      }
                    }
                    else{
                      print("NOT VALID");
                    }


                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, App_Routes.home_U, (route) => false);
                  },
                  child: Container(
                    width: 90.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Color(0xff649014),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.sp),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 90.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        VerticalDivider(
                          width: 25.w,
                          color: Colors.transparent,
                        ),
                        Image.asset(
                          Assets.google,
                          scale: 1,
                        ),
                        VerticalDivider(
                          width: 1.w,
                          color: Colors.transparent,
                        ),
                        Text("Sign in with Google ")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.sp),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don't Have An Account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register_U(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
