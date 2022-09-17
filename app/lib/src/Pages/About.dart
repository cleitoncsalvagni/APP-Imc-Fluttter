import 'package:app/src/Components/Menu.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Em construção"),
      ),
      drawer: Menu(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Em construção'),
          ],
        ),
      ),
    );
  }
}