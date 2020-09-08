import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/Onboard.dart';

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
              SizedBox(height: 150.0),
              Container(
                height: 150,
                width: 150,
                child: Image.network(
                  'https://scontent.fktm13-1.fna.fbcdn.net/v/t1.0-9/p960x960/75311433_104021631377552_4446240646090099989_o.png?_nc_cat=103&_nc_sid=85a577&_nc_ohc=O01xKcx9TvEAX9W7YqB&_nc_ht=scontent.fktm13-1.fna&oh=91792fcd07e0e8755bedb320ea08661a&oe=5F72CDFC',
                ),
              ),
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
              SizedBox(height: 25.0),
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
              SizedBox(height: 190.0),
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
