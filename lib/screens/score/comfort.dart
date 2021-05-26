import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_app/constants.dart';
// import 'package:trial_app/screens/quiz/quiz_screen.dart';
import 'package:trial_app/screens/quiz/scenario_screen.dart';
import 'package:trial_app/screens/score/score_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ComfortCheck extends StatelessWidget {
  final String scenario;
  final values;
  ComfortCheck(this.scenario, this.values);
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
                  Text("Would you like to continue? Please select 'No' if you feel saturated and would like to continue later. Your scores will be calculated on basis of questions answered thus far.",
                      style: Theme.of(context).textTheme.headline6.copyWith()),
                  SizedBox(height: 10),
                  // Text("Enter your information below"),
                  // Spacer(), // 1/6
                  // MyCustomForm(),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.off(ScenarioSelection()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Yes",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height:30),
                  InkWell(
                    onTap: () => Get.to(Confidence(scenario, values)),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "No",
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
class Confidence extends StatelessWidget {
  final String scenario;
  final values;
  Confidence(this.scenario, this.values);
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
                  Text("Do you feel this quiz has helped you understand your learning style?",
                      style: Theme.of(context).textTheme.headline6.copyWith()),
                  SizedBox(height: 10),
                  // Text("Enter your information below"),
                  // Spacer(), // 1/6
                  // MyCustomForm(),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(Feedback(scenario, values)),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Yes",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height:30),
                  InkWell(
                    onTap: () => Get.to(Feedback(scenario, values)),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "No",
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
class Feedback extends StatelessWidget {
  final String scenario;
  final values;
  Feedback(this.scenario, this.values);
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
                  Text("Please give your feedback below",
                      style: Theme.of(context).textTheme.headline6.copyWith()),
                  SizedBox(height: 10),
                  // Text("Enter your information below"),
                  // Spacer(), // 1/6
                  MyCustomForm(),
                  Spacer(), // 1/6
                  // InkWell(
                  //   onTap: () => Get.to(ScoreScreen(scenario, values)),
                  //   child: Container(
                  //     width: double.infinity,
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                  //     decoration: BoxDecoration(
                  //       gradient: kPrimaryGradient,
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //     child: Text(
                  //       "Yes",
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .button
                  //           .copyWith(color: Colors.black),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height:30),
                  InkWell(
                    onTap: () => Get.to(ScoreScreen(scenario, values)),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Submit",
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
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return "Please enter your feedback";
              }
              if (double.parse(value, (e) => null) != null){
                return "";
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF1C2341),
              hintText: "Feedback",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
