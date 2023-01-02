import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String? url;
  final Function()? onTap;

  const ProfilePicture({
    this.url,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: url == null
            ? Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )
            : Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(url!))),
              ));
  }
}
