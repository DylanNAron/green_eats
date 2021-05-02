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
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double totalRating = MealPage().theTotalRating;

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
            SizedBox(height: 220),
            Text(
              'Hi Name',
              textScaleFactor: 1.5,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Edit Name',
                  textScaleFactor: 1.2,
                )),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Rating',
                textScaleFactor: 1.2,
              ),
              Text(
                totalRating.toString(),
                textScaleFactor: 1.2,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
