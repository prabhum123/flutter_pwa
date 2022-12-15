import 'package:flutter/material.dart';

class Performances extends StatefulWidget {
  @override
  _PerformancesState createState() => _PerformancesState();
}

class _PerformancesState extends State<Performances> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Navigate to a new screen on Button click'),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: FlatButton(
          color: Colors.blueAccent,
          textColor: Colors.white,
          onPressed: () {
            

          },
          child: Text('GO TO HOME'),
        ),
      ),
    );
  }
}