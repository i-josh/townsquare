import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/app/app.router.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/ui/values/colors.dart';

import 'logo.dart';
import 'profile_picture.dart';

final headerMobile = AppBar(
  iconTheme: const IconThemeData(color: Colors.black),
  elevation: 0,
  backgroundColor: AppColors.secondary.withOpacity(0.5),
  centerTitle: true,
  title: const Logo(),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search),
    ),
    ProfilePicture(
      onTap: () {
        locator<NavigationService>().navigateTo(Routes.signIn);
      },
    ),
    const SizedBox(width: 20),
  ],
);
