import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'no_internet.dart';

class InternetConnectionChecker extends StatefulWidget {
  final Widget? child;
  const InternetConnectionChecker({Key? key, this.child}) : super(key: key);
  @override
  State<InternetConnectionChecker> createState() =>
      _InternetConnectionCheckerState();
}

class _InternetConnectionCheckerState extends State<InternetConnectionChecker> {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          return const NoInternet();
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return widget.child!;
      },
    );
  }
}
