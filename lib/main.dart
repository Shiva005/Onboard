import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

/// This is the main method of app, from here execution starts.
void main() => runApp(MyApp());

/// App widget class

class MyApp extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF01579b),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.network(
            'https://cdn.pixabay.com/photo/2017/09/20/16/54/smart-home-2769215_960_720.png'),
        body: Text(
          'Secure your home and office with our latest technology app.',
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            'SECURE HOME',
          ),
        ),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        mainImage: Image.network(
          'https://cdn.pixabay.com/photo/2017/09/20/16/54/smart-home-2769215_960_720.png',
          height: 400.0,
          width: 400.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: Color(0xFF004d40),
      bubble: Image.network(
          'https://cdn.pixabay.com/photo/2016/06/24/02/35/ehr-1476525_960_720.png'),
      body: Text(
        'Scan body temperature of every guest and family members automatically.',
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text('SCAN BODY SYSTEM'),
      ),
      mainImage: Image.network(
        'https://cdn.pixabay.com/photo/2016/06/24/02/35/ehr-1476525_960_720.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(color: Colors.white, fontSize: 22),
    ),
    PageViewModel(
      pageColor: Color(0xff1b5e20),
      bubble: Image.network(
          'https://cdn.pixabay.com/photo/2017/01/29/13/21/mobile-devices-2017980_960_720.png'),
      body: Text(
        'Now you can review each and every details of your app on our official website.',
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: Text('NOW ON WEBSITE'),
      ),
      mainImage: Image.network(
        'https://cdn.pixabay.com/photo/2017/01/29/13/21/mobile-devices-2017980_960_720.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(color: Colors.white, fontSize: 22),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}

/// Home Page of our example app.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Creative Developers'),
      ), //Appbar
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 200,
                child: Image.network(
                    'https://scontent.fktm13-1.fna.fbcdn.net/v/t1.0-9/p960x960/75311433_104021631377552_4446240646090099989_o.png?_nc_cat=103&_nc_sid=85a577&_nc_ohc=3S-z8oXsM7AAX_Ahvy7&_nc_ht=scontent.fktm13-1.fna&oh=b22ee0ddc6278d368a22077bf21255ba&oe=5F7AB6FC'),
              ),
              Container(
                child: Text(
                  '@app_and_web_developers',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ), //Center
    ); //Scaffold
  }
}
