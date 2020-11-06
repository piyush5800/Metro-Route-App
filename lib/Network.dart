import 'dart:collection';

import 'Stations.dart';

class Network {
  List<String> _stations;
  List<Set<String>> _network;

  void addConnection(String station1, String station2) {
    this
        ._network[this._stations.indexWhere((element) => element == station1)]
        .add(station2);
    this
        ._network[this._stations.indexWhere((element) => element == station2)]
        .add(station1);
  }

  void addLine(List<String> stationsOnLine) {
    this
        ._network
        .elementAt(this
            ._stations
            .indexWhere((element) => element == stationsOnLine[0]))
        .add(stationsOnLine[1]);
    for (int i = 1; i < stationsOnLine.length - 1; i++) {
      this
          ._network[this
              ._stations
              .indexWhere((element) => element == stationsOnLine[i])]
          .add(stationsOnLine[i - 1]);
      this
          ._network[this
              ._stations
              .indexWhere((element) => element == stationsOnLine[i])]
          .add(stationsOnLine[i + 1]);
    }

    this
        ._network[this._stations.indexWhere(
            (element) => element == stationsOnLine[stationsOnLine.length - 1])]
        .add(stationsOnLine[stationsOnLine.length - 2]);
  }

  void init() async {
    Stations stations = new Stations();
    await stations.init();
    this._stations = stations.getStationsNames();
    this._network =
        new List<Set<String>>.generate(this._stations.length, (i) => {});
    addLine(stations.getStationsNamesByLine("RED"));
    addLine(stations.getStationsNamesByLine("YELLOW"));
    addLine(stations.getStationsNamesByLine("RAPID"));
    addLine(stations.getStationsNamesByLine("AQUA"));
    addLine(stations.getStationsNamesByLine("VIOLET"));
    addLine(stations.getStationsNamesByLine("MAGENTA"));
    addLine(stations.getStationsNamesByLine("PINK"));
    addLine(stations.getStationsNamesByLine("ORANGE"));
    addLine(stations.getStationsNamesByLine("GRAY"));
    addLine(stations.getStationsNamesByLine("BLUE"));
    addLine(stations.getStationsNamesByLine("GREEN"));
    this
        ._network[this
            ._stations
            .indexWhere((element) => element == "Noida Electronic City")]
        .remove("Laxmi Nagar");
    this
        ._network[
            this._stations.indexWhere((element) => element == "Laxmi Nagar")]
        .remove("Noida Electronic City");
    this
        ._network[
            this._stations.indexWhere((element) => element == "Laxmi Nagar")]
        .add("Yamuna Bank");
    this
        ._network[
            this._stations.indexWhere((element) => element == "Yamuna Bank")]
        .add("Laxmi Nagar");
    this
        ._network[this
            ._stations
            .indexWhere((element) => element == "Satguru Ram Singh Marg")]
        .remove("Brigadier Hoshiar Singh");
    this
        ._network[this
            ._stations
            .indexWhere((element) => element == "Brigadier Hoshiar Singh")]
        .remove("Satguru Ram Singh Marg");
    this
        ._network[this
            ._stations
            .indexWhere((element) => element == "Satguru Ram Singh Marg")]
        .add("Ashok Park Main");
    this
        ._network[this
            ._stations
            .indexWhere((element) => element == "Ashok Park Main")]
        .add("Satguru Ram Singh Marg");
  }

  bool bredthFirstSearch(
      String source, String destination, List<int> pred, List<int> dist) {
    int sourceIndex = this._stations.indexWhere((element) => element == source);
    int destinationIndex =
        this._stations.indexWhere((element) => element == destination);

    Queue<int> q = new Queue<int>();
    List<bool> visited = new List<bool>.filled(this._stations.length, false);

    for (int i = 0; i < this._stations.length; i++) {
      visited[i] = false;
      dist[i] = 99999999;
      pred[i] = -1;
    }

    visited[sourceIndex] = true;
    dist[sourceIndex] = 0;
    q.add(sourceIndex);

    while (q.isNotEmpty) {
      int u = q.first;
      q.removeFirst();
      for (String s in this._network[u]) {
        int tempIndex = this._stations.indexWhere((element) => element == s);
        if (visited[tempIndex] == false) {
          visited[tempIndex] = true;
          dist[tempIndex] = dist[u] + 1;
          pred[tempIndex] = u;
          q.add(tempIndex);
          if (tempIndex == destinationIndex) {
            return true;
          }
        }
      }
    }
    return false;
  }

  List<String> shortestRoute(String source, String destination) {
    List<int> pred = new List<int>.filled(this._stations.length, -1);
    List<int> dist = new List<int>.filled(this._stations.length, 999999);
    List<String> path = [];
    if (bredthFirstSearch(source, destination, pred, dist) == false) {
      print("Not Connected");
      return path;
    }

    String crawl = destination;
    path.add(crawl);
    int index = this._stations.indexWhere((element) => element == crawl);
    while (pred[index] != -1) {
      index = this._stations.indexWhere((element) => element == crawl);
      path.add(this._stations[pred[index]]);
      crawl = this._stations[pred[index]];
      index = this._stations.indexWhere((element) => element == crawl);
    }
    return path;
  }
}
