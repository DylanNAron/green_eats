import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:green_eats/meal.dart';
import 'package:green_eats/account.dart';

/*
void main() {
  runApp(MyApp());
}
*/

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MyHomePage(title: 'Food Tracker'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _starType = '';
  var starTypes = ['1 star', '2 stars', '3 stars', '4 stars', '5 stars'];
  var answer1star = [
    'Try eating less red meat to improve your score. Turkey and chicken are the most environmentally friendly meats as they do not produce methane and need less food and water than sheep and cows.',
  ];
  var answer2stars = [
    'One star rating can be improved by reducing meat intake. Challenge yourself to go meatless one day a week to improve your score'
  ];
  var answer3stars = [
    'Small changes make a big difference. Try using non-dairy alternatives such as oat milk, almond milky or coconut milk.'
  ];
  var answer4stars = [
    'Reducing packaging waste can be the hardest part in achieving a 5 star rating. Carry your own reusable bag, water bottle, coffee cup, straw & remember to make choose the options with less packaging.'
  ];
  var answer5stars = [
    'Congratulations. Keep up the good work!',
  ];

  var answerText = '';

  void getAnswer() {
    if (selectedValue == '') {
      answerText = 'Please enter average rating';
    } else {
      var rng = new Random();
      switch (selectedValue) {
        case '1star':
          answerText = answer1star[rng.nextInt(answer1star.length)];
          break;
        case '2stars':
          answerText = answer2stars[rng.nextInt(answer2stars.length)];
          break;
        case '3stars':
          answerText = answer3stars[rng.nextInt(answer3stars.length)];
          break;
        case '4stars':
          answerText = answer4stars[rng.nextInt(answer4stars.length)];
          break;
        case '5stars':
          answerText = answer5stars[rng.nextInt(answer5stars.length)];
          break;
      }
    }
  }

  Future<void> _showMyDialog() async {
    getAnswer();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Daily Tip'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(answerText,
                    textScaleFactor: 2.0,
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String name = AccountPage().theUserName;
  double totalRating = MealPage().theTotalRating;
  String selectedValue = '1star';
  var options = ['1star', '2stars', '3stars', '4stars', '5stars'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Image.asset('greeneatslogo.png'),
      // ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Hi '+ name +', your average meal rating is ' + totalRating.toString(), textScaleFactor: 1.2,),
          SizedBox(height: 20),
          Text('1.Select Your Average Rating', textScaleFactor: 1.2,),
          SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedValue,
            onChanged: (String val) {
              setState(() {
                selectedValue = val;
              });
            },
            items: options
                .map((String item) => DropdownMenuItem<String>(
                    child: Text(item, textAlign: TextAlign.center),
                    value: item))
                .toList(),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              onPressed: _showMyDialog,
              child: Text('Get Tip')),
        ]),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
