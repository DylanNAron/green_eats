import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*
class MealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Icon(Icons.food_bank, size: 200));
  }
}
*/

class MealPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (MyHomePage(title: 'Food Tracker'));
  }

  double get theTotalRating {
    return totalRating;
  }

  var totalRating = _MyHomePageState().theTotalRating2;

  //double totalRating = theTo;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var proteins = ["None", "Chicken", "Beef", "Fish", "Beans"];
  var carbs = ["None", "Rice", "Pasta", "Potatoe"];
  var veggies = ["None", "Broccoli", "Spinach", "Carrots", "Green Beans"];

  var packaging = ["None", "Plastic", "Paper"];

  var howGetFood = [" ", "Home Grown", "Walk to Store", "Drive to Store"];
  var _howGetFoodPicked = "How?";

  var _proteinPicked = "Protein";
  var _carbPicked = "Carb";
  var _veggiePicked = "Veggie";

  var _proteinPackaging = "Packaging";
  var _carbPackaging = "Packaging";
  var _veggiePackaging = "Packaging";

  var mealsList = [];
  var totalProtein = 0.0; //
  var totalCalories = 0.0; //

  static var totalRating = 0.0;
  static var totalMeals = 0;

  TextEditingController _controllerP;
  TextEditingController _controllerC;
  TextEditingController _controllerV;

  double get theTotalRating2 {
    return totalRating;
  }

  void initState() {
    super.initState();
    _controllerP = TextEditingController();
    _controllerC = TextEditingController();
    _controllerV = TextEditingController();
  }

  void dispose() {
    _controllerP.dispose();
    _controllerC.dispose();
    _controllerV.dispose();
    super.dispose();
  }

  void changeTypeP(int index, var macro, var arrayItems) {
    setState(() {
      _proteinPicked = arrayItems[index];
    });
  }

  void changeTypePPackage(int index, var macro, var arrayItems) {
    setState(() {
      _proteinPackaging = packaging[index];
    });
  }

  void changeTypeCPackage(int index, var macro, var arrayItems) {
    setState(() {
      _carbPackaging = packaging[index];
    });
  }

  void changeTypeVPackage(int index, var macro, var arrayItems) {
    setState(() {
      _veggiePackaging = packaging[index];
    });
  }

  void changeTypeC(int index, var macro, var arrayItems) {
    setState(() {
      _carbPicked = arrayItems[index];
    });
  }

  void changeTypeV(int index, var macro, var arrayItems) {
    setState(() {
      _veggiePicked = arrayItems[index];
    });
  }

  void changeTypeHow(int index) {
    setState(() {
      _howGetFoodPicked = howGetFood[index];
    });
  }

  void getRating() {
    setState(() {
      var curRating = 4.5;
      switch (_proteinPicked) {
        case "Beef":
          curRating -= 1.0;
          break;
        case "Chicken":
          curRating -= 1.0;
          break;
        case "Fish":
          curRating -= .5;
          break;
      }
      switch (_proteinPackaging) {
        case "Plastic":
          curRating -= .5;
          break;
        case "Paper":
          curRating -= .25;
          break;
      }
      switch (_carbPackaging) {
        case "Plastic":
          curRating -= .5;
          break;
        case "Paper":
          curRating -= .25;
          break;
      }
      switch (_veggiePackaging) {
        case "Plastic":
          curRating -= .5;
          break;
        case "Paper":
          curRating -= .25;
          break;
      }

      switch (_howGetFoodPicked) {
        case "Drive to Store":
          curRating -= .75;
          break;
        case "Home Grown":
          curRating += .5;
          break;
      }

      totalMeals++;
      if (totalMeals == 1) {
        totalRating = curRating;
      } else {
        totalRating = (totalRating + curRating) / 2;
      }

      mealsList.add("Meal" +
          totalMeals.toString() +
          " is rated " +
          curRating.toString() +
          " stars.");
    });
  }

  void clear() {
    setState(() {
      mealsList = [];

      _howGetFoodPicked = "How?";

      _proteinPicked = "Protein";
      _carbPicked = "Carb";
      _veggiePicked = "Veggie";

      _proteinPackaging = "Packaging";
      _carbPackaging = "Packaging";
      _veggiePackaging = "Packaging";
    });
  }

  Widget _buildRowP(
      var arrayItems, TextEditingController controller, var macro) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CupertinoPicker(
                      itemExtent: 20.0,
                      children: [for (String name in arrayItems) Text(name)],
                      onSelectedItemChanged: (index) {
                        changeTypeP(index, macro, arrayItems);
                      });
                });
          },
          child: Text(_proteinPicked),
        ),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CupertinoPicker(
                      itemExtent: 20.0,
                      children: [for (String name in packaging) Text(name)],
                      onSelectedItemChanged: (index) {
                        changeTypePPackage(index, macro, arrayItems);
                      });
                });
          },
          child: Text(_proteinPackaging),
        ),
        /*
        Container(
          width: 200,
          height: 40,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: "Packaging",
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
          ),
        ),
        */
      ],
    );
  }

  Widget _buildRowC(
      var arrayItems, TextEditingController controller, var macro) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CupertinoPicker(
                      itemExtent: 20.0,
                      children: [for (String name in arrayItems) Text(name)],
                      onSelectedItemChanged: (index) {
                        changeTypeC(index, macro, arrayItems);
                      });
                });
          },
          child: Text(_carbPicked),
        ),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CupertinoPicker(
                      itemExtent: 20.0,
                      children: [for (String name in packaging) Text(name)],
                      onSelectedItemChanged: (index) {
                        changeTypeCPackage(index, macro, arrayItems);
                      });
                });
          },
          child: Text(_carbPackaging),
        ),
      ],
    );
  }

  Widget _buildRowV(
      var arrayItems, TextEditingController controller, var macro) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CupertinoPicker(
                      itemExtent: 20.0,
                      children: [for (String name in arrayItems) Text(name)],
                      onSelectedItemChanged: (index) {
                        changeTypeV(index, macro, arrayItems);
                      });
                });
          },
          child: Text(_veggiePicked),
        ),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CupertinoPicker(
                      itemExtent: 20.0,
                      children: [for (String name in packaging) Text(name)],
                      onSelectedItemChanged: (index) {
                        changeTypeVPackage(index, macro, arrayItems);
                      });
                });
          },
          child: Text(_veggiePackaging),
        ),
      ],
    );
  }

  Widget _buildRowHow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("How did you get the food?"),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CupertinoPicker(
                      itemExtent: 20.0,
                      children: [for (String name in howGetFood) Text(name)],
                      onSelectedItemChanged: (index) {
                        changeTypeHow(index);
                      });
                });
          },
          child: Text(_howGetFoodPicked),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                'Pick your foods and how they were packaged',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              _buildRowP(proteins, _controllerP, _proteinPicked),
              SizedBox(height: 20),
              _buildRowC(carbs, _controllerC, _carbPicked),
              SizedBox(height: 20),
              _buildRowV(veggies, _controllerV, _veggiePicked),
              SizedBox(height: 20),
              _buildRowHow(),
              SizedBox(height: 20),
              TextButton(onPressed: getRating, child: Text("Add Meal")),
              TextButton(onPressed: clear, child: Text("Clear")),
              //SizedBox(height: 20),
              Text("Total Rating: " + totalRating.toString(),
                  style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),
              Column(
                children: [
                  for (String name in mealsList)
                    Text(name, style: TextStyle(fontSize: 14))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
