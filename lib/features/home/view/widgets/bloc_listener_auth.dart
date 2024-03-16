import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enum/enum.dart';
import '../../../blocs/auth_bloc/auth_cubit.dart';
import '../../../blocs/main_bloc/main_cubit.dart';

class BlocListenerAuth extends StatelessWidget {
  const BlocListenerAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authChanged: (_, __) {
            return context.read<MainCubit>().getAll(TypeShow.limit).then(
              (_) {
                return context.read<MainCubit>().getTotals();
              },
            );
          },
          orElse: () {},
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
