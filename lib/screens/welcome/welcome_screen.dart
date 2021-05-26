import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_app/constants.dart';
import 'package:trial_app/screens/quiz/quiz_screen.dart';
import 'package:trial_app/screens/quiz/scenario_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
// import 'package:mongo_dart/mongo_dart.dart';

class WelcomeUser extends StatelessWidget {
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
                  Text("Let's find your PLS with a quiz",
                  style: Theme.of(context).textTheme.headline6.copyWith()),
                  SizedBox(height: 10),
                  Text("Enter your information below"),
                  Spacer(), // 1/6
                  MyCustomForm(),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(ScenarioSelection()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Start Quiz",
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
                return "Please enter your name";
              }
              if (double.parse(value, (e) => null) != null){
                return "";
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF1C2341),
              hintText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF1C2341),
              hintText: "Age",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        //   // Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 16.0),
        //     child: ElevatedButton(
        //       onPressed: () {
        //         // Validate returns true if the form is valid, or false
        //         // otherwise.
        //         if (_formKey.currentState.validate()) {
        //           ScaffoldMessenger.of(context)
        //               .showSnackBar(SnackBar(content: Text('Processing Data')));
        //         }
        //       },
        //     child: Text('Submit'),
        //   ),
        // ),
      ],
    ),
  );
}
}
