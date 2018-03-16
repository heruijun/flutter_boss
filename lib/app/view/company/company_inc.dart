import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyInc extends StatelessWidget {

  final String _companyInc;

  CompanyInc(this._companyInc);

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0,
          bottom: 50.0,
        ),
        child: new RichText(
          text: new TextSpan(
            text: _companyInc,
            style: new TextStyle(
                fontSize: 13.0,
                color: Colors.black
            ),
          ),
        )
    );
  }
}