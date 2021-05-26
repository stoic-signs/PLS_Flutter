import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trial_app/controllers/question_controller.dart';


import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    this.text,
    this.index,
    this.scenario,
    // this.press,
    // this.value,
  }) : super(key: key);
  final String text;
  final int index;
  final String scenario;
  // double value;
  // final VoidCallback value;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: Get.find<QuestionController>(),
        builder: (qnController) {
          Color getTheRightColor() {
            return kBlackColor;
          }

          return Container(
            // onTap: widget.press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Center(),
                  Row(
                    children: [Expanded(
                      child: Text(
                        "${index + 1}. $text",
                        style: TextStyle(color: getTheRightColor(), fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),]
                  ),
                ],
              ),
            ),
          );
        });
  }
}


