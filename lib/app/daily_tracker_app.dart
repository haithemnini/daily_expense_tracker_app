import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

<<<<<<< HEAD
import '../core/router/app_route.dart';
import '../core/styles/app_theme.dart';
=======
import '../core/routing/routing.dart';
>>>>>>> development

class DailyTrackerApp extends StatelessWidget {
  const DailyTrackerApp({
    super.key,
    required AppRouter appRoute,
  }) : _appRouter = appRoute;

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // context.systemUiOverlayStyleConfig();
=======
>>>>>>> development
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(390, 844),
      child: MaterialApp(
<<<<<<< HEAD
        debugShowCheckedModeBanner: false,
        title: 'Daily Tracker',
        theme: appTheme,
        darkTheme: appThemeDark,
        themeMode: ThemeMode.light,
        initialRoute: RoutesName.home,
=======
        title: 'Daily Tracker ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
>>>>>>> development
        onGenerateRoute: _appRouter.generateRoute,
      ),
    );
  }
}
