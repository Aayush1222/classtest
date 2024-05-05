import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  @override
  _GridViewScreenState createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  final String name = "Aayush";
  List<String> nameLetters = [];
  List<bool> buttonVisibility = [];
  List<Color> buttonColors = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < name.length; i++) {
      nameLetters.add(name[i]);
      buttonVisibility.add(false);
      buttonColors.add(Colors.blue);
    }
    _showLettersSerially();
  }

  void _showLettersSerially() {
    Future.delayed(Duration(milliseconds: 500), () {
      for (int i = 0; i < nameLetters.length; i++) {
        Future.delayed(Duration(milliseconds: i * 500), () {
          setState(() {
            buttonVisibility[i] = true;
          });
        });
      }
    });
  }

  void _toggleVisibility(int index) {
    setState(() {
      if (buttonColors[index] == Colors.blue) {
        buttonColors[index] = Colors.red;
      } else {
        buttonVisibility[index] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Screen'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < nameLetters.length ~/ 2; index++)
                Visibility(
                  visible: buttonVisibility[index],
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _toggleVisibility(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: buttonColors[index],
                          shape: BoxShape.circle,
                        ),
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          nameLetters[index],
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = nameLetters.length ~/ 2;
                  index < nameLetters.length;
                  index++)
                Visibility(
                  visible: buttonVisibility[index],
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _toggleVisibility(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: buttonColors[index],
                          shape: BoxShape.circle,
                        ),
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          nameLetters[index],
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
