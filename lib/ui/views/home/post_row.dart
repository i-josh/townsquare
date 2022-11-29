import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/profile_picture.dart';
import '../../values/colors.dart';

class PostRow extends StatelessWidget {
  final int index;

  const PostRow({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ProfilePicture(
                      url:
                          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80",
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "@user man",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Today 3:20 PM",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                const Icon(
                  Icons.more_horiz,
                  size: 15,
                  color: Colors.grey,
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, blurRadius: 0, offset: Offset(3, 3))
                ],
                color: index.isEven ? Colors.greenAccent : AppColors.secondary,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                child: Text(
                  "Politics",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layou",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _postAction(
                        icon: Icons.thumb_up_outlined,
                        value: "1k",
                        name: "likes"),
                    const SizedBox(width: 20),
                    _postAction(
                        icon: Icons.messenger_outline,
                        value: "100",
                        name: "comments"),
                    const SizedBox(width: 20),
                    _postAction(
                        icon: Icons.visibility, value: "3k", name: "views"),
                  ],
                ),
                const Divider(),
              ],
            )
          ],
        ),
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
        InkWell(
          onTap: () {},
          child: Icon(
            icon,
            size: 15,
          ),
        ),
        const SizedBox(width: 5),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$value ",
                style: GoogleFonts.sen(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black),
              ),
              TextSpan(
                text: " $name",
                style: GoogleFonts.sen(
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
