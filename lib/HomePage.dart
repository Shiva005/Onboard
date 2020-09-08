import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
