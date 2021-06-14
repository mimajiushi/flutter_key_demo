import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: PositionedTiles()));
}

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = [
      // StatefulColorfulTile(),
      // StatefulColorfulTile(),
      // StatefulColorfulTile(key: UniqueKey()),
      // StatefulColorfulTile(key: UniqueKey()),
      StatelessColorfulTile(),
      StatelessColorfulTile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sentiment_very_satisfied),
        // child: Icon(Icons.sentiment_very_dissatisfied),
        onPressed: swapTiles,
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

// ignore: must_be_immutable
class StatelessColorfulTile extends StatelessWidget {
  Color color = ColorUtil.randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: Padding(padding: EdgeInsets.all(70.0))
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StatefulColorfulTileState();
}

class StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color color;

  @override
  void initState() {
    super.initState();
    color = ColorUtil.randomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: Padding(padding: EdgeInsets.all(70.0))
    );
  }
}

class ColorUtil {
  static Color randomColor() {
    var red = Random.secure().nextInt(255);
    var greed = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(255, red, greed, blue);
  }
}
