import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/helper/helper.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../blocs/auth_bloc/auth_cubit.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => current.maybeMap(
        authChanged: (state) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        final user = state.maybeMap(
          authChanged: (state) => state.user,
          orElse: () => null,
        );

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: user?.photoUrl != null
                      ? CachedNetworkImage(
                          imageUrl: user!.photoUrl!,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          Helper.getAssetImage('guest.png'),
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome !',
                  style: AppTextStyle.caption.copyWith(
                    color: context.colorScheme.outline,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  user?.fullName ?? 'Guest',
                  style: AppTextStyle.subtitle.copyWith(
                    color: context.colorScheme.onBackground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
