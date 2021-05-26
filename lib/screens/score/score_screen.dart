import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_app/constants.dart';
import 'package:trial_app/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hive/hive.dart';
class SimpleBarChart extends StatelessWidget {
  final List<VAKStyle> seriesList;
  final bool animate;

  SimpleBarChart(@required this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  // factory SimpleBarChart.withSampleData() {
  //   return new SimpleBarChart(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }
  @override
   Widget build(BuildContext context) {
     List <charts.Series<VAKStyle, String>> series=[
       charts.Series(
       id: 'learningStyle',
       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
       domainFn: (VAKStyle sales, _) => sales.learningStyle,
       measureFn: (VAKStyle sales, _) => sales.score,
       data: seriesList,)
     ];
     return Container(
       height: 400,
       padding: EdgeInsets.all(20),
       child: Card(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: <Widget>[
               Text(
                 "VAK Scores",
                 style: Theme.of(context).textTheme.body2,
               ),
               Expanded(
                 child: charts.BarChart(
                   series, animate: true,
                    domainAxis: new charts.OrdinalAxisSpec(
                      renderSpec: new charts.SmallTickRendererSpec(

                          // Tick and Label styling here.
                          labelStyle: new charts.TextStyleSpec(
                              fontSize: 18, // size in Pts.
                              color: charts.MaterialPalette.white))),
                    primaryMeasureAxis: new charts.NumericAxisSpec(
                      renderSpec: new charts.GridlineRendererSpec(

                          // Tick and Label styling here.
                          labelStyle: new charts.TextStyleSpec(
                              fontSize: 18, // size in Pts.
                              color: charts.MaterialPalette.white))),
                 ),
               )
             ],
           ),
         ),
       ),
     );
   }

   /// Create one series with sample hard coded data.
   // static List<charts.Series<VAKStyle, String>> _createSampleData() {
   //   final data = [
   //     new VAKStyle('V', 55),
   //     new VAKStyle('A', 15),
   //     new VAKStyle('K', 40),
   //     // new OrdinalSales('2017', 75),
   //   ];

     // return [
     //   new charts.Series<VAKStyle, String>(
     //     id: 'PLS',
     //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
     //     domainFn: (VAKStyle sales, _) => sales.learningStyle,
     //     measureFn: (VAKStyle sales, _) => sales.score,
     //     data: data,
     //   )
     // ];
}


 class VAKStyle {
   final String learningStyle;
   final int score;

   VAKStyle(
     @required this.learningStyle,
     @required this.score);
 }


class ScoreScreen extends StatelessWidget {
  final String scenario;
  final values;
  List<VAKStyle> scores;
  ScoreScreen(this.scenario, this.values){
    scores=[
    new VAKStyle('Visual', this.values[0]),
    new VAKStyle('Auditory', this.values[1]),
    new VAKStyle('Kinesthetic', this.values[2]),
    // new OrdinalSales('2017', 75),
  ];}

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.find();
    var box=Hive.box("userID");
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          ListView(
            children: [
              Center(),
              // Spacer(),
              SizedBox(height: 100.0),
              Text(
                "PLS Scores",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kSecondaryColor),
                textAlign: TextAlign.center,
              ),
              // Spacer(),
              // Text(
              //   "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline4
              //       .copyWith(color: kSecondaryColor),
              // ),
              SimpleBarChart(
                scores,
                // Disable animations for image tests.
                // animate: false,
              ),
              SizedBox(height: 100.0),
              Text(
                "UID: ${box.get("userID")}",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: kSecondaryColor),
                textAlign: TextAlign.center,

              ),
              // Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
