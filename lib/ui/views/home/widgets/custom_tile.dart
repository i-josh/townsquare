import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/colors.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Image.network(
              "assets/images/$icon",
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
