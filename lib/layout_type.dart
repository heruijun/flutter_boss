import 'package:flutter/foundation.dart';

abstract class HasLayoutGroup {
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  job,
  company,
  chat,
  mine,
}

String layoutName(LayoutType layoutType) {
  switch (layoutType) {
    case LayoutType.job:
      return '职位';
    case LayoutType.company:
      return '公司';
    case LayoutType.chat:
      return '消息';
    case LayoutType.mine:
      return '我的';
    default:
      return '';
  }
}