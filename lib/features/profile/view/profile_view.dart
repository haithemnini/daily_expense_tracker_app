import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_service/user_service.dart';

import '../../../core/extension/extension.dart';
import '../../../core/helper/helper.dart';
import '../../../core/router/router.dart';
import '../../../core/shared/custom_material_button.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import 'widgets/widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: _buildBody(context),
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
                  _buildProfileImage(context),
                  _buildProfileDetails(context),
                  const ProfileForm(),
                  const Spacer(),
                  CustomMaterialButton(
                    onPressed: () => {},
                    text: 'Save',
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

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: AppColors.primaryGradient,
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/profile.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                width: 3,
                color: context.colorScheme.background,
              ),
              gradient: AppColors.primaryGradient,
            ),
            child: GestureDetector(
              onTap: () => {},
              child: Icon(
                FontAwesomeIcons.cameraRetro,
                size: 15,
                color: context.colorScheme.background,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'John Doe',
          style: AppTextStyle.title.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          textAlign: TextAlign.center,
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit.',
          style: AppTextStyle.caption,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
