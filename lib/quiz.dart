import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionMap;
  final Function selectHandler;
  final int questionIndex;
  Quiz(
    @required this.questionMap,
    @required this.questionIndex,
    @required this.selectHandler,
  );
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questionMap[questionIndex]["questionText"]),
      ...(questionMap[questionIndex]["answers"] as List<Map<String, Object>>)
          .map((answer) {
        return Answer(answer["text"], () => selectHandler(answer["score"]));
      }).toList()
    ]);
  }
}
