import 'package:flutter/material.dart';

class StaggeredAnimation {
  final AnimationController controller;
  final Animation<double> avatarSize;
  final Animation<double> titleOpacity;

  StaggeredAnimation(this.controller)
      : avatarSize = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.6, curve: Curves.elasticOut),
          ),
        ),
        titleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.6, curve: Curves.easeIn),
          ),
        );
}
