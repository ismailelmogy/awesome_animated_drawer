part of 'drawer_navigation_bloc.dart';

abstract class DrawerNavigationState extends Equatable {
  const DrawerNavigationState();

  @override
  List<Object> get props => [];
}

class DrawerNavigationInitial extends DrawerNavigationState {}

class DrawerIndexChanged extends DrawerNavigationState {}
