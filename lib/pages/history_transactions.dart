import 'package:flutter/material.dart';

void main() => runApp(HistoryTransactions());

class HistoryTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: Text('history transition'),
        ),
      ),
    );
  }
}
