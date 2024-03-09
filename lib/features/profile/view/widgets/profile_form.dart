import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_service/user_service.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/shared/shared.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../blocs/profile_bloc/profile_cubit.dart';
import 'widgets.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  late User user;

  @override
  void initState() {
    user = context.read<ProfileCubit>().currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ProfileCubit>().formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ProfileImage(user: user),
          const SizedBox(height: 20),
          Text(
            user.fullName,
            style: AppTextStyle.title.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            maxLines: 1,
            fontSize: 16,
            hintText: 'exp: John Doe',
            controller: context.read<ProfileCubit>().fullNameController,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(FontAwesomeIcons.userLarge, size: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: const BorderSide(width: 1.2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: BorderSide(
                color: context.colorScheme.outline,
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: BorderSide(
                color: context.colorScheme.primary,
                width: 1.2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: BorderSide(
                color: context.colorScheme.error,
                width: 1.2,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Full name cannot be empty';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
