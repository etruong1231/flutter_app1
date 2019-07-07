import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;
  Result(this.totalScore, this.resetHandler);
  String getResultPhrase() {
    String phrase;
    if (totalScore > 80) {
      phrase = "Eddie believes you guys will be best friend.";
    } else if (totalScore > 60) {
      phrase = "Eddie thinks okay about you.";
    } else {
      phrase = "Eddie does not think you are a great match for him.";
    }
    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "Total Score: ${totalScore} \n\n ${getResultPhrase()}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: RaisedButton(
              child: Text("Reset Questionaire"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: resetHandler,
            ),
          )
        ],
      ),
    );
  }
}
