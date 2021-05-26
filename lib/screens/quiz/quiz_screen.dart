import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_app/controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatefulWidget {
 final String scenario;
  QuizScreen(this.scenario);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      _controller = Get.find();
      _controller.updateScenario(this.widget.scenario);
    }
    catch(e){

      print(e);
      _controller = Get.put(QuestionController(this.widget.scenario));
    }
    print(this.widget.scenario);
    scheduleMicrotask(()=>_controller.resetQuestionNum());
  }
  QuestionController _controller;
  // ---------------------UPDATE WHEN DATABASE IS UPDATED-------------------
  // Use FutureBuilder with AsyncSnapshot
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
      body: Body(scenario:this.widget.scenario),
    );
  }
}
