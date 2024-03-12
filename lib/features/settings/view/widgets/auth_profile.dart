import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_service/user_service.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/helper/helper.dart';
import '../../../../core/router/app_route.dart';
import '../../../../core/router/router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/alerts/alerts.dart';
import '../../../blocs/auth_bloc/auth_cubit.dart';

class AuthProfile extends StatefulWidget {
  const AuthProfile({
    super.key,
  });

  @override
  State<AuthProfile> createState() => _AuthProfileState();
}

class _AuthProfileState extends State<AuthProfile> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().initAuth();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) => state.mapOrNull(
        error: (state) => Alerts.showToastMsg(context, state.message),
      ),
      builder: (context, state) {
        return Material(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: 120,
            child: state.maybeMap(
              authChanged: (state) => _buildProfile(
                context,
                authStatus: state.authStatus,
                user: state.user ?? User.guest(),
              ),
              error: (state) => _buildProfile(
                context,
                authStatus: AuthStatus.unauthenticated,
                user: User.guest(),
              ),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfile(
    BuildContext context, {
    required AuthStatus authStatus,
    required User user,
  }) {
    return InkWell(
      onTap: authStatus == AuthStatus.authenticated
          ? () => context.pushNamed(RoutesName.profile, arguments: user)
          : null, // Perform Sign-in action
      child: Row(
        children: [
          Container(
            height: 85,
            width: 80,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              gradient: AppColors.primaryGradient,
            ),
            child: Container(
              margin: const EdgeInsets.all(3),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: authStatus == AuthStatus.authenticated
                    ? CachedNetworkImageProvider(
                        user.photoUrl!.replaceFirst('s96', 's400'),
                      )
                    : AssetImage(
                        Helper.getAssetImage('guest.png'),
                      ) as ImageProvider,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(user.fullName, style: AppTextStyle.title),
              const SizedBox(height: 5),
              OutlinedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.google, size: 16),
                label: Text(
                  authStatus == AuthStatus.authenticated
                      ? 'Sign Out'
                      : 'Sign In',
                  style: AppTextStyle.caption,
                ),
                onPressed: authStatus == AuthStatus.authenticated
                    ? () {
                        // Perform Sign-out action
                        context.read<AuthCubit>().signOut();
                      }
                    : () {
                        // Perform Sign-in action
                        context.read<AuthCubit>().signInWithGoogle();
                      },
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.colorScheme.onSurface,
                  side: BorderSide(
                    color: context.colorScheme.onSurface,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
          if (authStatus == AuthStatus.authenticated) ...[
            const Spacer(),
            const FaIcon(FontAwesomeIcons.chevronRight, size: 18),
            const SizedBox(width: 20),
          ],
        ],
      ),
    );
  }
}
