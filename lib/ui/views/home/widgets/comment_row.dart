import 'package:flutter/material.dart';
import 'package:townsquare/core/models/comment.dart';
import 'package:townsquare/ui/components/profile_picture.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class CommentRow extends StatelessWidget {
  final Comment comment;

  const CommentRow({required this.comment, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const ProfilePicture(),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "@username",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          timeAgo.format(DateTime.parse(comment.createdAt!)),
                          style:
                              const TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.more_horiz,
                size: 15,
                color: Colors.grey,
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            comment.comment ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _postAction(
                      icon: Icons.thumb_up_outlined, value: "3", name: "likes"),
                  // const SizedBox(width: 20),
                  // _postAction(
                  //     icon: Icons.messenger_outline,
                  //     value: "100",
                  //     name: "comments"),
                  const SizedBox(width: 20),
                ],
              ),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }

  Widget _postAction({
    required IconData icon,
    required String value,
    required String name,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
        ),
        const SizedBox(width: 5),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$value ",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black),
              ),
              TextSpan(
                text: " $name",
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
