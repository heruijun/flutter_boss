import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyHotJob extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0,
          bottom: 50.0,
        ),
        child:  new RichText(
          text: new TextSpan(
            text: '敬请期待',
            style: new TextStyle(
                fontSize: 16.0,
                color: Colors.black
            ),
          ),
        )
    );
  }
}