part of 'drawer_navigation_bloc.dart';

abstract class DrawerNavigationEvent extends Equatable {
  const DrawerNavigationEvent();

  @override
  List<Object> get props => [];
}

class ChangeDrawerIndexEvent extends DrawerNavigationEvent {
  const ChangeDrawerIndexEvent({required this.drawerIndex});
  final DrawerIndex drawerIndex;
  @override
  List<Object> get props => [drawerIndex];
}
