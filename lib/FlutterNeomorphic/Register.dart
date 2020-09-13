import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

///Credit: www.idean.com

class Register extends StatelessWidget {
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
  Set<String> rides = Set();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          _AvatarField(),
          _TextField(
            label: "Full Name",
            hint: "",
            onChanged: (firstName) {
              setState(() {
                this.firstName = firstName;
              });
            },
          ),
          _TextField(
            label: "Phone Number",
            hint: "",
            onChanged: (lastName) {
              setState(() {
                this.lastName = lastName;
              });
            },
          ),
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
            height: 8,
          ),
          _AgeField(
            age: this.age,
            onChanged: (age) {
              setState(() {
                this.age = age;
              });
            },
          ),
          SizedBox(
            height: 8,
          ),
          _GenderField(
            gender: gender,
            onChanged: (gender) {
              setState(() {
                this.gender = gender;
              });
            },
          ),
          SizedBox(height: 20),
          NeumorphicButton(
            padding: EdgeInsets.symmetric(horizontal: 152, vertical: 15),
            margin: EdgeInsets.only(top: 20,bottom: 20,right: 10),
            onPressed: () {

            },
            style: NeumorphicStyle(
              depth: 4,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            child: Text(
              'Register',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                    color: Colors.blue[500], fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  '  SIGNIN',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
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

class _AgeField extends StatelessWidget {
  final double age;
  final ValueChanged<double> onChanged;

  _AgeField({@required this.age, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            "Age",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: NeumorphicTheme.defaultTextColor(context),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 5),
                child: NeumorphicSlider(
                  min: 18,
                  max: 99,
                  value: this.age,
                  onChanged: (value) {
                    this.onChanged(value);
                  },
                ),
              ),
            ),
            Text(
              "${this.age.floor()}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              width: 18,
            )
          ],
        ),
      ],
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
          margin: EdgeInsets.only(left: 8, right: 15, top: 2, bottom: 4),
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

class _GenderField extends StatelessWidget {
  final Gender gender;
  final ValueChanged<Gender> onChanged;

  const _GenderField({
    @required this.gender,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            "Gender",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: NeumorphicTheme.defaultTextColor(context),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 12),
            NeumorphicRadio(
              groupValue: this.gender,
              padding: EdgeInsets.all(20),
              style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.circle(),
              ),
              value: Gender.MALE,
              child: Icon(Icons.face),
              onChanged: (value) => this.onChanged(value),
            ),
            SizedBox(width: 12),
            NeumorphicRadio(
              groupValue: this.gender,
              padding: EdgeInsets.all(20),
              style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.circle(),
              ),
              value: Gender.FEMALE,
              child: Icon(Icons.pregnant_woman),
              onChanged: (value) => this.onChanged(value),
            ),
            SizedBox(width: 12),
            NeumorphicRadio(
              groupValue: this.gender,
              padding: EdgeInsets.all(20),
              style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.circle(),
              ),
              value: Gender.NON_BINARY,
              child: Icon(Icons.wc),
              onChanged: (value) => this.onChanged(value),
            ),
            SizedBox(
              width: 18,
            )
          ],
        ),
      ],
    );
  }
}
