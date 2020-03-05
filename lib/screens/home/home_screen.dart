import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return new Scaffold(appBar: _buildBar(context));
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Saryin"),
      centerTitle: true,
    );
  }
}


