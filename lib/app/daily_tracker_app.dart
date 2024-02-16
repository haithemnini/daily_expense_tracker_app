import 'package:daily_expense_tracker_app/core/helper/helper.dart';
import 'package:daily_expense_tracker_app/features/transaction/logic/transaction_cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_injections.dart';
import '../core/router/app_route.dart';
import '../core/styles/app_theme.dart';
import '../features/home/logic/main_bloc/main_cubit.dart';

class DailyTrackerApp extends StatelessWidget {
  const DailyTrackerApp({
    super.key,
    required AppRouter appRoute,
  }) : _appRouter = appRoute;

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    Helper.overlayNavigation(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<MainCubit>()),
        BlocProvider(create: (_) => getIt<TransactionCubit>()),
      ],
      child: ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        designSize: const Size(390, 844),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Daily Tracker',
          theme: appTheme,
          darkTheme: appThemeDark,
          themeMode: ThemeMode.dark,
          initialRoute: RoutesName.home,
          onGenerateRoute: _appRouter.generateRoute,
        ),
      ),
    );
  }
}
