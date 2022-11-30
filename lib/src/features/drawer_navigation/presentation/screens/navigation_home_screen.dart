import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/drawer/drawer_index.dart';
import '../../../../core/widgets/drawer/drawer_user_controller.dart';
import '../drawer_navigation/drawer_navigation_bloc.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({super.key});

  @override
  State<NavigationHomeScreen> createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.nearlyWhite,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
              backgroundColor: AppColors.nearlyWhite,
              body: BlocBuilder<DrawerNavigationBloc, DrawerNavigationState>(
                  builder: ((context, state) {
                return DrawerUserController(
                  screenIndex:
                      context.read<DrawerNavigationBloc>().currentDrawerIndex,
                  drawerWidth: context.width * 0.75,
                  onDrawerCall: (DrawerIndex drawerIndex) =>
                      BlocProvider.of<DrawerNavigationBloc>(context).add(
                          ChangeDrawerIndexEvent(drawerIndex: drawerIndex)),
                  screenView: context.read<DrawerNavigationBloc>().screenView,
                );
              }))),
        ));
  }
}
