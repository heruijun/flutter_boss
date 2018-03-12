import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const double _kTextAndIconTabHeight = 60.0;   // 导航高度
const double _kMarginBottom = 5.0;            // 图标与文字的间隔

class MyTab extends StatelessWidget {

  const MyTab({
    Key key,
    this.text,
    this.icon,
  }): assert(text != null || icon != null),
        super(key: key);

  final String text;
  final Widget icon;

  Widget _buildLabelText() {
    return new Text(text, softWrap: false, overflow: TextOverflow.fade);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    double height = _kTextAndIconTabHeight;
    Widget label = icon;
    label = new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: icon,
            margin: const EdgeInsets.only(bottom: _kMarginBottom),
          ),
          _buildLabelText()
        ]
    );

    return new SizedBox(
      height: height,
      child: new Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(new StringProperty('text', text, defaultValue: null));
    description.add(
        new DiagnosticsProperty<Widget>('icon', icon, defaultValue: null));
  }
}