import 'package:flutter/material.dart';
import '../../../config/locale/app_localizations.dart';
import '../../utils/app_images.dart';
import '../../utils/commons.dart';
import 'drawer_item.dart';
import '../../utils/app_colors.dart';
import 'drawer_index.dart';
import 'drawer_item_data.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer(
      {Key? key,
      this.screenIndex,
      this.iconAnimationController,
      this.onChangeDrawerIndex})
      : super(key: key);

  final AnimationController? iconAnimationController;
  final DrawerIndex? screenIndex;
  final Function(DrawerIndex)? onChangeDrawerIndex;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    final List<DrawerItemData> drawerList = <DrawerItemData>[
      DrawerItemData(
        index: DrawerIndex.home,
        labelName: AppLocalizations.of(context)!.translate('home')!,
        icon: const Icon(Icons.home),
      ),
      DrawerItemData(
          index: DrawerIndex.help,
          labelName: AppLocalizations.of(context)!.translate('help')!,
          isAssetsImage: true,
          imageName: AppImages.supportIcon),
      DrawerItemData(
        index: DrawerIndex.feedBack,
        labelName: AppLocalizations.of(context)!.translate('feedback')!,
        icon: const Icon(Icons.help),
      ),
      DrawerItemData(
        index: DrawerIndex.invite,
        labelName: AppLocalizations.of(context)!.translate('invite_friend')!,
        icon: const Icon(Icons.group),
      ),
      DrawerItemData(
        index: DrawerIndex.share,
        labelName: AppLocalizations.of(context)!.translate('rate_the_app')!,
        icon: const Icon(Icons.share),
      ),
      DrawerItemData(
        index: DrawerIndex.about,
        labelName: AppLocalizations.of(context)!.translate('about_us')!,
        icon: const Icon(Icons.info),
      ),
      DrawerItemData(
        index: DrawerIndex.language,
        labelName: AppLocalizations.of(context)!.translate('language')!,
        icon: const Icon(Icons.language_rounded),
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.notWhite.withOpacity(0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: widget.iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return ScaleTransition(
                        scale: AlwaysStoppedAnimation<double>(1.0 -
                            (widget.iconAnimationController!.value) * 0.2),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation<double>(Tween<double>(
                                      begin: 0.0, end: 24.0)
                                  .animate(CurvedAnimation(
                                      parent: widget.iconAnimationController!,
                                      curve: Curves.fastOutSlowIn))
                                  .value /
                              360),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: AppColors.grey.withOpacity(0.6),
                                    offset: const Offset(2.0, 4.0),
                                    blurRadius: 8),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(60.0)),
                              child: Image.asset(AppImages.defaultProfileImage),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 4),
                    child: Text(
                      'Ismail Elmogy',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Divider(
            height: 1,
            color: AppColors.grey.withOpacity(0.6),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerList.length,
              itemBuilder: (BuildContext context, int index) {
                return DrawerItem(
                  drawerItemData: drawerList[index],
                  screenIndex: widget.screenIndex,
                  iconAnimationController: widget.iconAnimationController,
                  onChangeDrawerIndex: navigationToScreen,
                );
              },
            ),
          ),
          Divider(
            height: 1,
            color: AppColors.grey.withOpacity(0.6),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.translate('sign_out')!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.darkText,
                  ),
                  textAlign: TextAlign.left,
                ),
                trailing: const Icon(
                  Icons.power_settings_new,
                  color: Colors.red,
                ),
                onTap: () => Commons.showLogoutDialog(context),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> navigationToScreen(DrawerIndex indexScreen) async {
    widget.onChangeDrawerIndex!(indexScreen);
  }
}
