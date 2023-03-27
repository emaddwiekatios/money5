import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(child: SliderButton(
      action: () {
        ///Do something here
      //  Navigator.of(context).pop();
      },
      label: Text(
        "Slide to cancel Event",
        style: TextStyle(
            color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
      ),
      icon: Text(
        "x",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 44,
        ),
      ),


    ));
  }
}
