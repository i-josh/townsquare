import 'package:flutter/material.dart';

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
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
