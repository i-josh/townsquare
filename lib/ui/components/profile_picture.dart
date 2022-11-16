import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String? url;
  const ProfilePicture({
    this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            url!
          )
        )
      ),
    );
  }
}