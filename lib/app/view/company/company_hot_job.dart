import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyHotJob extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 10.0,
          right: 10.0,
          bottom: 10.0,
        ),
        child: new Row(
          children: <Widget>[
            new RichText(
              text: new TextSpan(
                text: '敬请期待',
                style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.black
                ),
              ),
            )
          ],
        )
    );
  }
}