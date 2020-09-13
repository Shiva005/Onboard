import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

///Credit: www.idean.com
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(
        defaultTextColor: Color(0xFF3E3E3E),
        accentColor: Colors.grey,
        variantColor: Colors.black38,
        depth: 8,
        intensity: 0.65,
      ),
      themeMode: ThemeMode.light,
      child: _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  __PageState createState() => __PageState();
}

enum Gender { MALE, FEMALE, NON_BINARY }

class __PageState extends State<_Page> {
  String firstName = "";
  String lastName = "";
  double age = 18;
  Gender gender;
  bool check1 = false;
  Set<String> rides = Set();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 20),
          _AvatarField(),
          _TextField(
            label: "Email",
            hint: "",
            onChanged: (lastName) {
              setState(() {
                this.lastName = lastName;
              });
            },
          ),
          _TextField(
            label: "Password",
            hint: "",
            onChanged: (lastName) {
              setState(() {
                this.lastName = lastName;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 17.0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: check1,
                onChanged: (value) {
                  setState(() {
                    check1 = value;
                  });
                },
              ),
              Text(
                'Remember Me',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          NeumorphicButton(
            padding: EdgeInsets.symmetric(horizontal: 160, vertical: 15),
            margin: EdgeInsets.only(top: 20,bottom: 20,right: 5),
            onPressed: () {
              print("click");
            },
            style: NeumorphicStyle(
              depth: 4,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(
                    color: Colors.blue[500], fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  '  SIGNUP',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _AvatarField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          depth: 4,
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
    );
  }
}

class _TextField extends StatefulWidget {
  final String label;
  final String hint;

  final ValueChanged<String> onChanged;

  _TextField({@required this.label, @required this.hint, this.onChanged});

  @override
  __TextFieldState createState() => __TextFieldState();
}

class __TextFieldState extends State<_TextField> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.hint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            this.widget.label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: NeumorphicTheme.defaultTextColor(context),
            ),
          ),
        ),
        Neumorphic(
          margin: EdgeInsets.only(left: 8, right: 17, top: 2, bottom: 4),
          style: NeumorphicStyle(
            depth: -4,
            boxShape: NeumorphicBoxShape.stadium(),
          ),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          child: TextField(
            onChanged: this.widget.onChanged,
            controller: _controller,
            decoration: InputDecoration.collapsed(hintText: this.widget.hint),
          ),
        )
      ],
    );
  }
}
