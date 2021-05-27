import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:trial_app/constants.dart';
// import 'package:trial_app/screens/quiz/quiz_screen.dart';
// import 'package:trial_app/screens/quiz/scenario_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminPanel extends StatelessWidget {
  final _url="https://cloud.mongodb.com/v2/6086d4a6fae6c706fed08f9f#clusters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
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
                  Text("Please visit the link below on PC and sign in to access admin rights:",
                      style: Theme.of(context).textTheme.headline6.copyWith()),
                  SizedBox(height: 10),
                  // Text("Enter your information below"),
                  // Spacer(), // 1/6
                  InkWell(
                    onTap: () => _launchURL(),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Admin Panel",
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
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
