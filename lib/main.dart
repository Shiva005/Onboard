import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:onboarding/Onboard.dart';

import 'FlutterNeomorphic/NeomorphicHome.dart';
import 'InfiniteCards.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('Creative Developers'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0),
              Neumorphic(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 4,
                  color: Colors.grey[100],
                  shape: NeumorphicShape.convex,
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
                  height: 100,
                  child: Image(
                    image: AssetImage(
                      'assets/images/logo_trans.png',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text('@app_and_web_developers'),
              SizedBox(height: 20.0),
              SizedBox(
                height: 45.0,
                width: MediaQuery.of(context).size.width - 70,
                child: RaisedButton(
                  elevation: 10.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Colors.blueGrey[300],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Onboard()),
                    );
                  },
                  child: Text(
                    'Onboard UI',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width - 70,
                child: RaisedButton(
                  elevation: 10.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Colors.blueGrey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => infiniteCards()),
                    );
                  },
                  child: const Text(
                    'Infinite Cards',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width - 70,
                child: RaisedButton(
                  elevation: 10.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Colors.blueGrey[700],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NeomorphicHome()),
                    );
                  },
                  child: const Text(
                    'Neomorphic Page',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 220.0),
              Container(
                margin: EdgeInsets.only(left: 65),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.insert_link,
                      color: Colors.red[400],
                      size: 30.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6.0),
                      child: Text(
                        'FOLLOW US FOR MORE UPDATES',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
