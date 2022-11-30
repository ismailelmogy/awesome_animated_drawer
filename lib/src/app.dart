import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/change_language/presentation/bloc/locale_bloc.dart';

import 'features/drawer_navigation/presentation/bloc/drawer_navigation_bloc.dart';
import 'injection_container.dart' as di;

class AwesomeAnimatedDrawerApp extends StatefulWidget {
  const AwesomeAnimatedDrawerApp({
    Key? key,
  }) : super(key: key);
  @override
  State<AwesomeAnimatedDrawerApp> createState() =>
      _AwesomeAnimatedDrawerAppState();
}

class _AwesomeAnimatedDrawerAppState extends State<AwesomeAnimatedDrawerApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<LocaleBloc>()..add(GetSavedLangEvent()),
        ),
        BlocProvider(
          create: (_) => di.sl<DrawerNavigationBloc>(),
        )
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, localeState) {
          return MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            theme: appTheme(),
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            locale: localeState.locale,
          );
        },
      ),
    );
  }
}
