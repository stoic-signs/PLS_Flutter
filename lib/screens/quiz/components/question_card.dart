import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_app/controllers/question_controller.dart';
import 'package:trial_app/models/Questions.dart';
import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatefulWidget {
  final String scenario;
  const QuestionCard({
    Key key,
    this.press,
    this.scenario,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key);
  final Question question;
  final VoidCallback press;
  // double _value_V;
  // double _value_A;
  // double _value_K;

  @override
  _QuestionCardState createState() => new _QuestionCardState();
}


class _QuestionCardState extends State<QuestionCard> {
  double _value_V=33.33;
  double _value_A=33.33;
  double _value_K=33.33;
  var values;
  void initState(){
  values=[_value_V, _value_A, _value_K];
  }
  double diff_V=0;
  double diff_A=0;
  double diff_K=0;

  @override
  Widget build(
  BuildContext context) {
    QuestionController _controller = Get.find();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListView(
        // mainAxisSize: MainAxisSize.max,
        children: [Center(),
          Text(
            widget.question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: 5.00),
          ...List.generate(
            widget.question.options.length,
            (index) => Option(
              scenario: widget.scenario,
              index: index,
              text: widget.question.options[index],
              // value: () => _controller.savePercent(question, index, Option.value),
            ),
          ),
          SizedBox(height:15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Color(0xFF43C8AD),
                    inactiveTrackColor: Color(0xFFACE1EA),
                    trackShape: RectangularSliderTrackShape(),
                    trackHeight: 3.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    thumbColor: Color(0xFF43C8AD),
                    overlayColor: Color(0xFF43C8AD).withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    activeTickMarkColor: Color(0xFF43C8AD),
                    inactiveTickMarkColor: Color(0xFFACE1EA),
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Color(0xFF43C8AD),
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    value: _value_V,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: '${_value_V.round()}',
                    onChanged: (value) {
                      setState(() {
                          diff_V = value -_value_V;
                          _value_V = value;
                        },
                      );
                    },
                    onChangeEnd: (value){
                      setState(() {
                        // print(diff_V);
                        if (diff_V>0)
                        {
                          if (0<=(_value_A - diff_V)){
                            _value_A = _value_A - diff_V;}
                          else{
                            diff_A = diff_V - _value_A;
                            _value_A = 0;
                            _value_K= 0<=(_value_K-diff_A)?(_value_K-diff_A):0;
                          }
                        }
                        else{
                          if(100>=(_value_A - diff_V)) {
                            _value_A = _value_A - diff_V;
                          }
                          else{
                            diff_A=diff_V+_value_A;
                            _value_A=100;
                            _value_K= 100>=(_value_K-diff_A)?(_value_K-diff_A):100;

                          }
                          // _value_A =100>=(_value_A - diff_V)?_value_A - diff_V:100;
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:10.0),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Color(0xFF43C8AD),
                inactiveTrackColor: Color(0xFFACE1EA),
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 3.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Color(0xFF43C8AD),
                overlayColor: Color(0xFF43C8AD).withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Color(0xFF43C8AD),
                inactiveTickMarkColor: Color(0xFFACE1EA),
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Color(0xFF43C8AD),
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Slider(
                value: _value_A,
                min: 0,
                max: 100,
                divisions: 100,
                label: '${_value_A.round()}',
                onChanged: (value) {
                  setState(
                        () {
                          diff_A = value -_value_A;
                          _value_A = value;
                    });
                },
                onChangeEnd: (value){
                setState(() {
                  // print(diff_A);
                  // if (diff)
                  if (diff_A>0){
                    if (0<=(_value_K - diff_A)){
                      _value_K = _value_K - diff_A;}
                    else{
                      diff_K = diff_A - _value_K;
                      _value_K = 0;
                      _value_V= 0<=(_value_V-diff_K)?(_value_V-diff_K):0;

                    }
                    // _value_K = 0 <= (_value_K - diff_A)
                    //     ? _value_K - diff_A
                    //     : 0;
                  }
                    else {
                    if(100>=(_value_K - diff_A)) {
                      _value_K = _value_K - diff_A;
                    }
                    else{
                      diff_K=diff_A+_value_K;
                      _value_K=100;
                      _value_V= 100>=(_value_V-diff_K)?(_value_V-diff_K):100;
                    }
                    // _value_K = 100 >= (_value_K - diff_A)
                    //     ? _value_K - diff_A
                    //     : 100;
                  }
                });
                },
              ),
            ),
          ),
            ],
          ),
          SizedBox(height:10.0),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Color(0xFF43C8AD),
                inactiveTrackColor: Color(0xFFACE1EA),
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 3.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Color(0xFF43C8AD),
                overlayColor: Color(0xFF43C8AD).withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Color(0xFF43C8AD),
                inactiveTickMarkColor: Color(0xFFACE1EA),
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Color(0xFF43C8AD),
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Slider(
                value: _value_K,
                min: 0,
                max: 100,
                divisions: 100,
                label: '${_value_K.round()}',
                onChanged: (value) {
                  setState(
                        () {
                      diff_K=value-_value_K;
                      _value_K = value;
                    },
                  );
                },
                  onChangeEnd: (value){
                    setState(() {
                      // print(diff_K);
                      if (diff_K>0){
                        if (0<=(_value_V - diff_K)){
                          _value_V = _value_V - diff_K;}
                        else{
                          diff_V = diff_K - _value_V;
                          _value_V = 0;
                          _value_A= 0<=(_value_A-diff_V)?(_value_A-diff_V):0;
                        }
                        // _value_V =0<=(_value_V - diff_K)?_value_V - diff_K:0;
                      }
                      else {
                        if(100>=(_value_V - diff_K)) {
                          _value_V = _value_V - diff_K;
                        }
                        else{
                          diff_V=diff_K + _value_V;
                          _value_V=100;
                          _value_A= 100>=(_value_A-diff_V)?(_value_A-diff_V):100;
                        }
                      }
                    });
                  }
              ),
            ),
          ),
            ],
          ),
          // SizedBox(height:5.0),

          SizedBox(height:30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text("Please tap on the sliders instead of dragging.",
                  style: Theme.of(context)
                      .textTheme.headline6.copyWith(color:Colors.black),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF43C8AD)
            ),
            child: Text("Next",
          style: Theme.of(context)
                .textTheme.headline6.copyWith(color:Colors.white),
              ),
              onPressed: (){
                values=[_value_V, _value_A, _value_K];
                print("Pressed ${widget.question.id}");
                _controller.savePercent(widget.question, values);
              },
          ),
          SizedBox(height:20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xFF43C8AD)
            ),
            child: Text("Exit",
              style: Theme.of(context)
                  .textTheme.headline6.copyWith(color:Colors.white),
            ),
            onPressed: (){
              _controller.exit();
            },
          ),
        ],
      ),
    );
  }
}
