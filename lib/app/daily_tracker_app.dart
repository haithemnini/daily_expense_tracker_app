import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/extensions/extensions.dart';
import '../core/routing/routing.dart';
import '../core/theming/theming.dart';

class DailyTrackerApp extends StatelessWidget {
  const DailyTrackerApp({
    super.key,
    required AppRouter appRoute,
  }) : _appRouter = appRoute;

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    context.systemUiOverlayStyleConfig();
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(390, 844),
      child: MaterialApp(
        title: 'Daily Tracker',
        debugShowCheckedModeBanner: false,
        theme: Themeing.lightTheme,
        darkTheme: Themeing.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: RoutesName.home,
        onGenerateRoute: _appRouter.generateRoute,
      ),
    );
  }
}
