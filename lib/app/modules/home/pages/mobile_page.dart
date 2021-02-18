import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MobileHomePage extends StatefulWidget {
  final String title;
  MobileHomePage({this.title});
  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // ignore: deprecated_member_use
            RaisedButton(
                child: Text("Editor RichText"),
                onPressed: () {
                  Modular.to.pushNamed('/text_editor_page');
                })
          ],
        ),
      ),
    );;
  }
}
