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
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var proteins = [" ", "Chicken", "Beef"];
  var carbs = [" ", "Rice", "Pasta"];
  var veggies = [" ", "Broccoli", "Spinach"];

  var _proteinPicked = "Protein";
  var _carbPicked = "Carb";
  var _veggiePicked = "Veggie";

  var mealsList = [];
  var totalProtein = 0.0;
  var totalCalories = 0.0;

  TextEditingController _controllerP;
  TextEditingController _controllerC;
  TextEditingController _controllerV;

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

  void convertAndAdd() {
    setState(() {
      var curProtein = 0.0; //oz
      var curCalories = 0.0; //cal
      switch (_proteinPicked) {
        case "Chicken":
          curProtein += double.parse(_controllerP.text) * 8;
          curCalories += double.parse(_controllerP.text) * 47;
          break;
        case "Beef":
          curProtein += double.parse(_controllerP.text) * 7;
          curCalories += double.parse(_controllerP.text) * 71;
          break;
      }
      switch (_veggiePicked) {
        case "Broccoli":
          curCalories += double.parse(_controllerV.text) * 10;
          break;
        case "Spinach":
          curCalories += double.parse(_controllerV.text) * 7;
          break;
      }
      switch (_carbPicked) {
        case "Rice":
          curCalories += double.parse(_controllerC.text) * 37;
          break;
        case "Pasta":
          curCalories += double.parse(_controllerC.text) * 38;
          break;
      }
      var size = mealsList.length + 1;
      totalProtein += curProtein;
      totalCalories += curCalories;
      mealsList.add("Meal" +
          size.toString() +
          " is " +
          curProtein.toString() +
          "grams of Protein & " +
          curCalories.toString() +
          " calories.");
    });
  }

  void clear() {
    setState(() {
      totalProtein = 0;
      totalCalories = 0;
      mealsList = [];
      _controllerC.text = "";
      _controllerP.text = "";
      _controllerV.text = "";
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
        Container(
          width: 200,
          height: 40,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
          ),
        )
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
        Container(
          width: 200,
          height: 40,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
          ),
        )
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
        Container(
          width: 200,
          height: 40,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
          ),
        )
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
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/foodbackground.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                'Pick your foods and the amount for each (oz)',
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
              TextButton(onPressed: convertAndAdd, child: Text("Add Meal")),
              TextButton(onPressed: clear, child: Text("Clear")),
              //SizedBox(height: 20),
              Text("Total Protein: " + totalProtein.toString(),
                  style: TextStyle(fontSize: 30)),
              Text("Total Calories: " + totalCalories.toString(),
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
