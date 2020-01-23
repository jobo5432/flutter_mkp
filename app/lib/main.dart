import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    Timer(
      Duration(milliseconds: 1500),
      () => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.linear,
        duration: Duration(milliseconds: 60 * 1000),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Michael Kaz",
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
              color: Colors.white,
              width: 250,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.black38,
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            'Image $index'.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 36.0),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
