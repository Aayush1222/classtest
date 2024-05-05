import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  @override
  _GridViewScreenState createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  final String name = "Aayushman";
  List<String> nameLetters = [];
  List<bool> buttonVisibility = [];
  List<Color> buttonColors = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < name.length; i++) {
      nameLetters.add(name[i]);
      buttonVisibility.add(true);
      buttonColors.add(Colors.blue);
    }
  }

  void _toggleVisibility(int index) {
    setState(() {
      if (buttonColors[index] == Colors.blue) {
        buttonColors[index] = Colors.red;
      } else {
        buttonVisibility[index] = !buttonVisibility[index];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Screen'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3, // Set the cross axis count to 3
        childAspectRatio: 2,
        children: List.generate(name.length, (index) {
          return Visibility(
            visible: buttonVisibility[index],
            child: InkWell(
              onTap: () {
                _toggleVisibility(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: buttonColors[index],
                  shape: BoxShape.circle,
                ),
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  nameLetters[index],
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
