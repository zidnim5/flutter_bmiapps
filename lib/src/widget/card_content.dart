import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class CardContent extends StatelessWidget {
  CardContent({@required this.icon, this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 80.0),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
      ],
    );
  }
}
