import 'package:flutter/material.dart';
import 'package:swipe_to_action/swipe_to_action.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text = "Swipe some tiles!";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: [
            Swipeable(
              key: ValueKey(1),
              onSwipe: (direction) {
                if (direction == SwipeDirection.startToEnd) {
                  setState(() {
                    _text = "Swiped to right!";
                  });
                } else {
                  setState(() {
                    _text = "Swiped to left!";
                  });
                }
              },
              child: ListTile(
                title: Text("Tile one"),
              ),
            ),
            Swipeable(
              key: ValueKey(2),
              onSwipe: (direction) {
                setState(() {
                  _text = "This one can only be swiped to right!";
                });
              },
              background: Container(color: Colors.orange),
              direction: SwipeDirection.startToEnd,
              child: ListTile(
                title: Text("Tile one"),
              ),
            ),
            Swipeable(
              key: ValueKey(3),
              onSwipe: (direction) {
                setState(() {
                  _text = "This one was confirmed with a function!";
                });
              },
              background: Container(color: Colors.green),
              secondaryBackground: Container(color: Colors.teal),
              confirmSwipe: (direction) async {
                return true;
              },
              child: ListTile(
                title: Text("Tile three"),
              ),
            ),
            Center(child: Text(_text)),
          ],
        ),
      ),
    );
  }
}
