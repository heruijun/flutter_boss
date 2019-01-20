import 'package:flutter/material.dart';

class ScrollImageItem extends StatelessWidget {
  ScrollImageItem({Key key, this.url, this.onPressed, this.heroTag}) : super(key: key);
  final String url;
  final String heroTag;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Hero(
            tag: heroTag,
            child: Container(
              margin: EdgeInsets.only(right: 20.0),
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: Image.network(url, width: 300, fit: BoxFit.cover),
              ),
            )));
  }
}
