import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final String url;
  final String heroTag;

  GalleryPage(
      {Key key,
      @required this.url,
      @required this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 0, 0, 0),
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(100, 0, 0, 0),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0, -0.2),
              child: Hero(
                tag: heroTag,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(url, width: 300, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
