import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:trial_app/models/Questions.dart';
import 'package:trial_app/models/questions_db.dart';
import 'package:trial_app/screens/score/comfort.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:hive/hive.dart';
// import 'dart:convert' show json;

// We use get package for our state management

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  String scenario;
  QuestionController(String scenario){
    this.scenario=scenario;
  }
  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions;

  List<Question> get questions => this._questions;
  var vak_values=[0, 0, 0];
  int answered=0;
  int total;
  var _db;
  // Map<int, double> responses={0:0,1:0,2:0};
  // bool _isAnswered = false;
  // bool get isAnswered => this._isAnswered;

  // for more about obs please check documentation
  RxInt _questionNumber = 0.obs;
  RxInt get questionNumber => this._questionNumber;
  // int questionNumber=0;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  resetQuestionNum(){
    _questionNumber.value=1;
    update();
  }
  // called immediately after the widget is allocated memory
  @override
  void onInit() async {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();

      }
      );
    print(scenario);
    // await
    getConnection();
    // ------------------Uncomment on updating database--------------------
    // var coll = _db.collection("question");
    // var _collection = await coll.find(where.eq("scenario", scenario).sortBy("qid")).toList();
    // print(_collection.length);
    // print(_collection[0]);
    // _questions = _collection.map(
    //       (question) => Question.fromJson(Map.from(question).cast<String, dynamic>()
        // id: question.['qid'],
        // question: question['question'],
        // options: question['options'],
    //   ),
    // )
    //     ?.toList();
    // print(_questions);
    _questions= sample_data[this.scenario]
        ?.map(
          (question) => Question(
        id: question['id'],
        question: question['question'],
        options: question['options'],
      ),
    )
        ?.toList();
    // start our animation
    // Once 60s is completed go to the next qn
    // _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();
    total=questions.length;
    // scenario='furniture';
    // this.scenario="";
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() async{
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
    await _db.close();
  }

  void updateScenario(String newScenario) async{

    print("UPDATE SCENARIO");
    print("$newScenario");
    // super.onClose();
    // _animationController.dispose();
    // _pageController.dispose();
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();

      }
      );
    // print(newScenario);
    // await getConnection();
    var coll = _db.collection("question");
    _questions = await coll.find(where.eq("scenario", newScenario).sortBy("qid"))
        ?.map(
          (question) => Question(
        id: question['qid'],
        question: question['question'],
        options: question['options'],
        // answer: question['answer_index']
      ),
    )
        ?.toList();
    // _questions= sample_data[newScenario]
    //     ?.map(
    //       (question) => Question(
    //     id: question['id'],
    //     question: question['question'],
    //     options: question['options'],
    //     // answer: question['answer_index']
    //   ),
    // )
    //     ?.toList();
    // start our animation
    // Once 60s is completed go to the next qn
    // _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    total+=questions.length;
    scenario=newScenario;
    print(scenario);
    getConnection();
    // answered=0;
    // scenario='furniture';
    // this.scenario="";
    // super.onInit();

  }

  void savePercent(Question question, var values){
    // because once user press "Next" then it will run
    // _isAnswered = true;
    // _correctAns = question.answer;
    // _selectedAns = selectedIndex;
    // print(_db);
    answered+=1;
    vak_values[0]+=values[0].round().toInt();
    vak_values[1]+=values[1].round().toInt();
    vak_values[2]+=values[2].round().toInt();
    print("Sent values: $values");
    print("Aggregate values: ${vak_values.cast<int>()}");
    postUserResponse(question.id, values);

    // It will stop the counter
    // _animationController.stop();
    update();

    // Once user clicks "Next", after 1s it will go to the next qn
    Future.delayed(Duration(seconds: 0), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      // _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn+
      // _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to navigate another page

      onClose();
      Get.to(ComfortCheck(this.scenario, this.vak_values));
    }
  }
  void exit(){
    onClose();
    Get.to(ComfortCheck(this.scenario, this.vak_values));
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  Future<Db> getConnection() async{
    print("Initiated connection");
    // var _db;
      try {
         _db = await Db.create("mongodb+srv://<user>:<password>@cluster0.ouci5.mongodb.net/pls_bot?retryWrites=true&w=majority");
        await _db.open();
      } catch(e){
        print(e);
      }
    print("Established connection");
      return _db;

    // return _db;
  }

  Future<ObjectId>postUserResponse(int qid, List<double> values) async{
    // var _db= await getConnection();
    var coll=_db.collection("response");
    var inserted_id=new ObjectId();
    var box=Hive.box("userID");
    await coll.insertOne(
      {'_id': inserted_id,
        'uid': box.get("userID"),
        'scenario': this.scenario,
        'qid': qid,
        'values':values,
      }
    );
    // await _db.close();
    print(inserted_id.toHexString());
  }
}
