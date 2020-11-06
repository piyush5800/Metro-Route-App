import 'package:flutter/material.dart';
import 'Station.dart';

class RouteScreen extends StatelessWidget {
  final String source;
  final String destination;

  final List<Station> path;
  final Map<String, Color> palette = {
    "RED": Color.fromRGBO(208, 59, 63, 1.0),
    "BLUE": Color.fromRGBO(53, 125, 187, 1.0),
    "GREEN": Color.fromRGBO(71, 160, 114, 1.0),
    "YELLOW": Color.fromRGBO(252, 232, 108, 1.0),
    "AQUA": Color.fromRGBO(107, 166, 183, 1.0),
    "PINK": Color.fromRGBO(215, 113, 133, 1.0),
    "VIOLET": Color.fromRGBO(66, 38, 71, 1.0),
    "MAGENTA": Color.fromRGBO(133, 64, 141, 1.0),
    "GRAY": Color.fromRGBO(192, 192, 192, 1.0),
    "ORANGE": Color.fromRGBO(214, 119, 66, 1.0),
    "RAPID": Color.fromRGBO(85, 188, 201, 1.0),
  };

  List<Widget> getPathCards() {
    List<Widget> cards = [];
    for (Station s in path) {
      cards.add(
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
                  child: Text(
                    s.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  height: 7,
                  color: this.palette[s.line],
                )
              ],
            ),
          ),
        ),
      );
    }
    return cards;
  }

  RouteScreen({this.source, this.destination, this.path});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delhi Metro Route"),
        backgroundColor: Color.fromRGBO(177, 55, 51, 1.0),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        child: Text(
                          "${this.source}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_right_alt,
                        size: 40,
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        child: Text(
                          "${this.destination}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                height: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Estimated Time of Journey",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                "${(this.path.length - 1) * 2} minutes",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: this.getPathCards(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
