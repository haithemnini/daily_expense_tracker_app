import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_service/user_service.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../blocs/profile_bloc/profile_cubit.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key, required this.user});

  final User user;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  bool _isUpdateProfile = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
        gradient: AppColors.primaryGradient,
      ),
      child: Stack(
        children: [
          _buildImage(),
          _buildCameraIcon(context),
        ],
      ),
    );
  }

  Container _buildImage() {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipOval(
        child: _isUpdateProfile
            ? Image.file(
                context.read<ProfileCubit>().selectedImage!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: widget.user.photoUrl!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Align _buildCameraIcon(BuildContext context) {
    return Align(
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
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => _onChooseImage(),
            child: Icon(
              FontAwesomeIcons.cameraRetro,
              color: context.colorScheme.background,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }

  _onChooseImage() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        context.read<ProfileCubit>().selectedImage = File(image.path);
        _isUpdateProfile = true;
      });
    }
  }
}
