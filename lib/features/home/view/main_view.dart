import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/main_bloc/main_cubit.dart';
import 'widgets/widgets.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().getTotals().then((_) {
      context.read<MainCubit>().getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Column(
          children: [
            HeaderAppBar(),
            SizedBox(height: 20),
            ExpenseCard(),
            SizedBox(height: 5),
            HeaderTransaction(),
            AllTransaction(),
          ],
        ),
      ),
    );
  }
}
