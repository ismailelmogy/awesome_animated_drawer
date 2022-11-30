import 'package:flutter/material.dart';
import 'drawer_index.dart';

class DrawerItemData {
  DrawerItemData({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.imageName = '',
  });

  String labelName;
  Icon? icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex? index;
}
