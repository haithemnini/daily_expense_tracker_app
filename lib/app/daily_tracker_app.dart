import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app_injections.dart';
import '../core/helper/helper.dart';
import '../core/router/app_route.dart';
import '../core/styles/app_theme.dart';
import '../features/blocs/auth_bloc/auth_cubit.dart';
import '../features/blocs/main_bloc/main_cubit.dart';
import '../features/blocs/profile_bloc/profile_cubit.dart';
import '../features/blocs/state_bloc/state_cubit.dart';
import '../features/blocs/themes_bloc/themes_cubit.dart';
import '../features/blocs/transaction_bloc/transaction_cubit.dart';

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
        BlocProvider(create: (_) => getIt<ProfileCubit>()),
        BlocProvider(create: (_) => getIt<StateCubit>()),
        BlocProvider(create: (_) => getIt<AuthCubit>()),
        BlocProvider(create: (_) => getIt<ThemesCubit>())
      ],
      child: BlocBuilder<ThemesCubit, ThemesState>(
        buildWhen: (previous, current) => current is LoadedThemeMode,
        builder: (context, state) {
          final themeMode = context.read<ThemesCubit>().state.maybeMap(
                orElse: () => ThemeMode.system,
                loadedThemeMode: (state) => state.themeMode,
              );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Daily Tracker',
            theme: appTheme,
            darkTheme: appThemeDark,
            themeMode: themeMode,
            initialRoute: RoutesName.home,
            onGenerateRoute: _appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
