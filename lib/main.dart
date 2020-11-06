import 'package:flutter/material.dart';
import 'Stations.dart';
import 'RouteScreen.dart';
import 'Network.dart';
import 'Station.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedSourceLine = "NONE";
  String selectedDestinationLine = "NONE";
  List<DropdownMenuItem> sourceList = [];
  List<DropdownMenuItem> destinationList = [];
  String selectedSource;
  String selectedDestination;

  void updateCurrentStateSource(String color) async {
    selectedSourceLine = color;
    Stations temp = new Stations();
    await temp.init();
    sourceList = temp.getStationsByLine(selectedSourceLine);

    setState(() {
      selectedSource = sourceList[0].value;
    });
  }

  void updateCurrentStateDestination(String color) async {
    selectedDestinationLine = color;
    Stations temp = new Stations();
    await temp.init();
    destinationList = temp.getStationsByLine(selectedDestinationLine);

    setState(() {
      selectedDestination = destinationList[0].value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delhi Metro Route"),
        backgroundColor: Color.fromRGBO(177, 55, 51, 1.0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image(
              image: AssetImage("assets/images/logo.png"),
              width: 90,
              height: 90,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome to the Delhi Metro Navigator",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Source",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(
                  buttonPadding: EdgeInsets.all(0),
                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("RED");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "RED" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(208, 59, 63, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("BLUE");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "BLUE" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(53, 125, 187, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("GREEN");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "GREEN" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(71, 160, 114, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("YELLOW");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "YELLOW" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(252, 232, 108, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("AQUA");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "AQUA" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(107, 166, 183, 1.0),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(
                  buttonPadding: EdgeInsets.all(0),
                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("PINK");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "PINK" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(215, 113, 133, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("VIOLET");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "VIOLET" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(66, 38, 71, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("MAGENTA");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "MAGENTA" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(133, 64, 141, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("GRAY");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "GRAY" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(192, 192, 192, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("ORANGE");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "ORANGE" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(214, 119, 66, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateSource("RAPID");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedSourceLine == "RAPID" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(85, 188, 201, 1.0),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton(
              items: sourceList,
              value: selectedSource,
              onChanged: (value) {
                setState(() {
                  selectedSource = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Destination",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(
                  buttonPadding: EdgeInsets.all(0),
                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("RED");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "RED" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(208, 59, 63, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("BLUE");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "BLUE" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(53, 125, 187, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("GREEN");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "GREEN" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(71, 160, 114, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("YELLOW");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "YELLOW" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(252, 232, 108, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("AQUA");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "AQUA" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(107, 166, 183, 1.0),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(
                  buttonPadding: EdgeInsets.all(0),
                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("PINK");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "PINK" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(215, 113, 133, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("VIOLET");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "VIOLET" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(66, 38, 71, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("MAGENTA");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "MAGENTA" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(133, 64, 141, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("GRAY");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "GRAY" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(192, 192, 192, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("ORANGE");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "ORANGE" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(214, 119, 66, 1.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          updateCurrentStateDestination("RAPID");
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color.fromRGBO(255, 255, 255,
                            selectedDestinationLine == "RAPID" ? 1.0 : 0.0),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(85, 188, 201, 1.0),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton(
              items: destinationList,
              value: selectedDestination,
              onChanged: (value) {
                setState(() {
                  selectedDestination = value;
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              height: 40,
              minWidth: 200,
              shape: StadiumBorder(),
              onPressed: () async {
                Stations stations = new Stations();
                Network network = new Network();
                await stations.init();
                await network.init();
                List<String> path = List<String>.from(
                  network
                      .shortestRoute(
                          this.selectedSource, this.selectedDestination)
                      .reversed,
                );
                List<Station> coloredPath = [];
                for (String s in path) {
                  coloredPath.add(stations.getStationByName(s));
                }
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new RouteScreen(
                      source: selectedSource,
                      destination: selectedDestination,
                      path: coloredPath,
                    ),
                  ),
                );
              },
              child: Text(
                "Find Route",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              color: Color.fromRGBO(177, 55, 51, 1.0),
            ),
          ],
        ),
      ),
    );
  }
}
