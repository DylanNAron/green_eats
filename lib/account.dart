import 'package:flutter/material.dart';
import 'package:green_eats/meal.dart';

/*
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Icon(Icons.food_bank, size: 200));
  }
}
*/

class AccountPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (MyHomePage(title: 'Food Tracker'));
  }

  String get theUserName {
    return userName;
  }

  var userName = _MyHomePageState().theUserName2;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double totalRating = MealPage().theTotalRating;
  TextEditingController _controller;
  static String userName = 'User Name';

  String get theUserName2 {
    return userName;
  }

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      userName = _controller.text;
    });
  }

  Future<void> _changeName() async {
    _controller.text = "";
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Change Name'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: "New Name:"),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                ),
                onPressed: () {
                  _controller.text = "";
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Save Name'),
                onPressed: () {
                  setState(() {
                    userName = _controller.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Image.asset('assets/greeneatslogo.png'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 150),
            Text(
              'Hi ' + userName,
              textScaleFactor: 1.5,
            ),
            ElevatedButton(
                onPressed: () {
                  _changeName();
                },
                child: Text(
                  'Edit Name',
                  textScaleFactor: 1.2,
                )),
              SizedBox(height: 50),
            Image.asset('assets/Profile-01.png', 
              height: 200,
              width: 200,),
            SizedBox(height: 50),
            Text(
              'Rating ' + totalRating.toString(),
              textScaleFactor: 1.2,
            ),
          ],
        ),
      ),
    );
  }
}
