import 'package:flutter/material.dart';

import 'Station.dart';

import 'package:flutter/services.dart';

class Stations {
  List<Station> _stations;

  Stations() {
    this._stations = [];
  }

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void init() async {
    var path = "assets/data/Stations/Red.txt";
    String temp = await loadAsset(path);
    List<String> temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "RED"));
    }

    path = "assets/data/Stations/Yellow.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "YELLOW"));
    }

    path = "assets/data/Stations/Blue.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "BLUE"));
    }

    path = "assets/data/Stations/Green.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "GREEN"));
    }

    path = "assets/data/Stations/Violet.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "VIOLET"));
    }

    path = "assets/data/Stations/Pink.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "PINK"));
    }

    path = "assets/data/Stations/Magenta.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "MAGENTA"));
    }

    path = "assets/data/Stations/Orange.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "ORANGE"));
    }

    path = "assets/data/Stations/Gray.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "GRAY"));
    }

    path = "assets/data/Stations/Rapid.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "RAPID"));
    }

    path = "assets/data/Stations/Aqua.txt";
    temp = await loadAsset(path);
    temp2 = temp.split(",");
    for (String s in temp2) {
      this._stations.add(new Station(name: s, line: "AQUA"));
    }
  }

  List<DropdownMenuItem> getStationsByLine(String line) {
    List<DropdownMenuItem> list = [];
    for (Station s in this._stations) {
      if (s.line == line) {
        list.add(DropdownMenuItem(
          child: Text(s.name),
          value: s.name,
        ));
      }
    }
    return list;
  }

  List<Station> getStations() {
    return this._stations;
  }

  List<String> getStationsNames() {
    Set<String> stationsNames = {};
    for (Station s in this._stations) {
      stationsNames.add(s.name);
    }
    return stationsNames.toList();
  }

  List<String> getStationsNamesByLine(String line) {
    List<String> stationsNames = [];
    for (Station s in this._stations) {
      if (s.line == line) {
        stationsNames.add(s.name);
      }
    }
    return stationsNames;
  }

  Station getStationByName(String station) {
    return this._stations[
        this._stations.indexWhere((element) => element.name == station)];
  }
}
