import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_app/constants.dart';
import 'package:trial_app/screens/welcome/welcome_screen.dart';
import 'package:trial_app/screens/admin/admin_screen.dart';
// import 'package:trial_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
// import 'package:mongo_dart/mongo_dart.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    "Preferred Learning Style",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text("Choose 'Admin' to modify questions, 'User' to take quiz",
                      style: Theme.of(context).textTheme.headline6.copyWith()),
                  SizedBox(height: 10),
                  // Text("Enter your information below"),
                  // Spacer(), // 1/6
                  // MyCustomForm(),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(AdminPanel()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Admin",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height:30),
                  InkWell(
                    onTap: () => Get.to(WelcomeUser()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "User",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),

                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
