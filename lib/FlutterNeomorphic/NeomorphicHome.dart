import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:onboarding/FlutterNeomorphic/Register.dart';

import 'Login.dart';
import 'NeoLandingPage.dart';

///Credit: www.idean.com
///https://pub.dev/packages/flutter_neumorphic

class NeomorphicHome extends StatefulWidget {
  NeomorphicHome({Key key}) : super(key: key);

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<NeomorphicHome> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumorphicColors.accent,
        depth: 4,
        intensity: 0.5,
      ),
      child: _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  createState() => _PageState();
}

class _PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      padding: EdgeInsets.only(top: 10.0, left: 10.0),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                _SmallWidget(),
                _DefaultWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DefaultWidget extends StatefulWidget {
  @override
  createState() => _DefaultWidgetState();
}

class _DefaultWidgetState extends State<_DefaultWidget> {
  int _selectedIndex = 0;

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, top: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: NeumorphicToggle(
              height: 50,
              style: NeumorphicToggleStyle(
                  //backgroundColor: Colors.red,
                  ),
              selectedIndex: _selectedIndex,
              displayForegroundOnlyIfSelected: true,
              children: [
                ToggleElement(
                  background: Center(
                      child: Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                  foreground: Center(
                      child: Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
                ),
                ToggleElement(
                  background: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                  foreground: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
                ),
                ToggleElement(
                  background: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                  foreground: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
                )
              ],
              thumb: Neumorphic(
                style: NeumorphicStyle(
                  depth: 8,
                  boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.all(Radius.circular(12))),
                ),
              ),
              onChanged: (value) {
                setState(
                  () {
                    _selectedIndex = value;
                    print("_firstSelected: $_selectedIndex");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCode(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        child: NeoLanding(),
      );
    } else if (index == 1) {
      return Container(
        child: Login(),
      );
    } else if (index == 2) {
      return Container(
        child: Register(),
      );
    }
    return Container();
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildWidget(context),
        _buildCode(context, _selectedIndex),
      ],
    );
  }
}

class _SmallWidget extends StatefulWidget {
  @override
  createState() => _SmallWidgetState();
}

class _SmallWidgetState extends State<_SmallWidget> {
  int _selectedIndex = 1;

  Widget _buildWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        NeumorphicToggle(
          height: 40,
          width: 100,
          selectedIndex: _selectedIndex,
          children: [
            ToggleElement(
              background: Center(
                  child: Icon(
                Icons.arrow_back,
                color: Colors.grey[800],
              )),
            ),
            ToggleElement(),
          ],
          thumb: Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.all(Radius.circular(12)),
              ),
            ),
            child: Icon(
              Icons.blur_on,
              color: Colors.grey,
            ),
          ),
          onAnimationChangedFinished: (value) {
            if (value == 0) {
              print("onAnimationChangedFinished: $_selectedIndex");
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();
              }
            }
          },
          onChanged: (value) {
            setState(() {
              _selectedIndex = value;
              print("_firstSelected: $_selectedIndex");
            });
          },
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildWidget(context),
      ],
    );
  }
}
