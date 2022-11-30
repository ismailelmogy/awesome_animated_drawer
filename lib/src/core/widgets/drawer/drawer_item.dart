import 'package:flutter/material.dart';
import '../../utils/media_query_values.dart';
import '../../utils/app_colors.dart';
import 'drawer_index.dart';
import 'drawer_item_data.dart';

class DrawerItem extends StatelessWidget {
  final DrawerItemData drawerItemData;
  final AnimationController? iconAnimationController;
  final DrawerIndex? screenIndex;
  final Function(DrawerIndex)? onChangeDrawerIndex;
  const DrawerItem(
      {super.key,
      required this.drawerItemData,
      this.screenIndex,
      required this.onChangeDrawerIndex,
      required this.iconAnimationController});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () => onChangeDrawerIndex!(drawerItemData.index!),
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: screenIndex == drawerItemData.index
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  drawerItemData.isAssetsImage
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(drawerItemData.imageName,
                              color: screenIndex == drawerItemData.index
                                  ? Colors.blue
                                  : AppColors.nearlyBlack),
                        )
                      : Icon(drawerItemData.icon?.icon,
                          color: screenIndex == drawerItemData.index
                              ? Colors.blue
                              : AppColors.nearlyBlack),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    drawerItemData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: screenIndex == drawerItemData.index
                          ? Colors.blue
                          : AppColors.nearlyBlack,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            screenIndex == drawerItemData.index
                ? AnimatedBuilder(
                    animation: iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (context.width * 0.75 - 64) *
                                (1.0 - iconAnimationController!.value - 1.0),
                            0.0,
                            0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width: context.width * 0.75 - 64,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(28),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
