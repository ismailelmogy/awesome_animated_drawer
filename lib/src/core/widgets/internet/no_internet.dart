import 'package:awesome_animated_drawer/src/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import '../../../config/locale/app_localizations.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.signal_wifi_off,
              size: 120,
              color: Colors.grey[400],
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('sorry..no_internet_connection')!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                )),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  AppLocalizations.of(context)!.translate('check_your_router')!,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w400),
                )),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('reconnect_to_network')!,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w400),
                )),
            Container(
                height: 50,
                margin: EdgeInsets.symmetric(
                    horizontal: context.width * 0.25, vertical: 20),
                child: Builder(
                    builder: (context) => ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('refresh_screen')!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0),
                              )),
                        )))
          ],
        )));
  }
}
