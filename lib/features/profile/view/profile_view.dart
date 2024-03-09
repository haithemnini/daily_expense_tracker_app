import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_service/user_service.dart';

import '../../../core/extension/extension.dart';
import '../../../core/helper/helper.dart';
import '../../../core/router/router.dart';
import '../../../core/shared/custom_material_button.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../core/utils/alerts/alerts.dart';
import '../../blocs/profile_bloc/profile_cubit.dart';
import 'widgets/widgets.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.user});

  final User user;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    context.read<ProfileCubit>().init(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.maybeMap(
            loading: (_) => Alerts.showLoaderDialog(context),
            success: (state) {
              context.pop();
              context.pop();
              Alerts.showToastMsg(context, state.message);
            },
            error: (state) {
              context.pop();
              context.pop();
              Alerts.showToastMsg(context, state.message);
            },
            orElse: () {},
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: _buildBody(context),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: context.colorScheme.background,
      systemOverlayStyle: Helper.overlayStyleAppBar(context),
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 18),
        onPressed: () => context.pop(),
      ),
      title: Text(
        'Profile',
        style: AppTextStyle.title.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Center(
              child: Column(
                children: [
                  const ProfileForm(),
                  const Spacer(),
                  CustomMaterialButton(
                    text: 'Save',
                    onPressed: () {
                      context.read<ProfileCubit>().updateProfile();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
