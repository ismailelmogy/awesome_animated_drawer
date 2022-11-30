import 'package:awesome_animated_drawer/src/features/home/presentation/screens/home_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/drawer/drawer_index.dart';
import '../../../change_language/presentation/screens/change_language_screen.dart';
import '../../../feedback/presentation/screens/feedback_screen.dart';
import '../../../help/presentation/screens/help_screen.dart';
import '../../../invite_friend/presentation/screens/invite_friend_screen.dart';
part 'drawer_navigation_event.dart';
part 'drawer_navigation_state.dart';

class DrawerNavigationBloc
    extends Bloc<DrawerNavigationEvent, DrawerNavigationState> {
  DrawerIndex currentDrawerIndex = DrawerIndex.home;
  Widget screenView = const HomeScreen();
  DrawerNavigationBloc() : super(DrawerNavigationInitial()) {
    on<ChangeDrawerIndexEvent>(_onChangeDrawerIndex);
  }

  Future<void> _onChangeDrawerIndex(
    ChangeDrawerIndexEvent event,
    Emitter<DrawerNavigationState> emit,
  ) async {
    if (currentDrawerIndex != event.drawerIndex) {
      emit(DrawerNavigationInitial());
      currentDrawerIndex = event.drawerIndex;
      switch (currentDrawerIndex) {
        case DrawerIndex.home:
          screenView = const HomeScreen();
          emit(DrawerIndexChanged());
          break;

        case DrawerIndex.help:
          screenView = const HelpScreen();
          emit(DrawerIndexChanged());
          break;

        case DrawerIndex.feedBack:
          screenView = const FeedbackScreen();
          emit(DrawerIndexChanged());
          break;

        case DrawerIndex.language:
          screenView = const ChangeLanguageScreen();
          emit(DrawerIndexChanged());
          break;

        case DrawerIndex.invite:
          screenView = const InviteFriendScreen();
          emit(DrawerIndexChanged());
          break;

        default:
          break;
      }
    }
  }
}
