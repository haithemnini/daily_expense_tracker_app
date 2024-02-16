import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/shared/shared.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    /// Defines the border style for the text input fields in the profile form.
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(width: 1.2),
    );

    /// Defines the border style for the enabled text input fields in the profile form.
    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(
        color: context.colorScheme.outline,
        width: 1.2,
      ),
    );

    /// Defines the border style for the focused text input fields in the profile form.
    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(
        color: context.colorScheme.primary,
        width: 1.2,
      ),
    );

    /// Defines the border style for the text input fields with errors in the profile form.
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(
        color: context.colorScheme.error,
        width: 1.2,
      ),
    );

    /// Defines the padding for the content inside the text input fields in the profile form.
    const contentPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextFormField(
            hintText: 'Full Name',
            controller: TextEditingController(),
            fontSize: 16,
            maxLines: 1,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(FontAwesomeIcons.userLarge, size: 12),
            border: border,
            contentPadding: contentPadding,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: TextEditingController(),
            hintText: 'Description',
            fontSize: 16,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(FontAwesomeIcons.userLarge, size: 12),
            border: border,
            contentPadding: contentPadding,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
          ),
        ],
      ),
    );
  }
}
