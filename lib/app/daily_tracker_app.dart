import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/router/app_route.dart';
import '../core/styles/app_theme.dart';

class DailyTrackerApp extends StatelessWidget {
  const DailyTrackerApp({
    super.key,
    required AppRouter appRoute,
  }) : _appRouter = appRoute;

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(390, 844),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Tracker',
        theme: appTheme,
        darkTheme: appThemeDark,
        themeMode: ThemeMode.light,
        initialRoute: RoutesName.home,
        onGenerateRoute: _appRouter.generateRoute,
      ),
    );
  }
}
