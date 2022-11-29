import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:townsquare/ui/views/home/post_row.dart';
import 'package:townsquare/ui/views/home/sponsored_row.dart';

import '../../values/colors.dart';
import 'header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70),
        child: const Header(),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Material(
                  elevation: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(30),
                      children: [
                        Text(
                          "Forums",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        _customListTile(icon: "sports.png", title: "Sports"),
                        _customListTile(icon: "tv.png", title: "Entertainment"),
                        _customListTile(icon: "career.png", title: "Career"),
                        _customListTile(icon: "romance.png", title: "Romance"),
                        _customListTile(
                            icon: "business.png", title: "Business"),
                        _customListTile(
                            icon: "education.png", title: "Education"),
                        _customListTile(icon: "health.png", title: "Health"),
                        _customListTile(
                            icon: "properties.png", title: "Properties"),
                        _customListTile(
                            icon: "automobiles.png", title: "Automobiles"),
                        _customListTile(icon: "travel.png", title: "Travel"),
                        _customListTile(icon: "tech.png", title: "Tech")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Material(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trending Gist",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          child: RawScrollbar(
                            thumbColor: AppColors.primary,
                            trackBorderColor: Colors.transparent,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return PostRow(
                                  index: index,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Material(
                  elevation: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(30),
                      children: [
                        Text(
                          "Sponsored",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const SponsoredRow();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          )
        ],
      ),
    );
  }

  Widget _customListTile({
    required String icon,
    required String title,
  }) {
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
