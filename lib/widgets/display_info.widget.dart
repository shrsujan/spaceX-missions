import 'package:flutter/material.dart';

class DisplayInfoWidget extends StatelessWidget {
  final String title;
  final dynamic value;

  const DisplayInfoWidget({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 3.0),
        child: RichText(
            text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: '$title: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: value)
        ])));
  }
}
