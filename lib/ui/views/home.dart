import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:townsquare/ui/components/submit_button.dart';
import 'package:townsquare/ui/components/text_field_widget.dart';

import '../components/profile_picture.dart';
import '../values/colors.dart';

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
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
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
                      _customListTile(
                          icon: "entertainment.png", title: "Entertainment"),
                      _customListTile(icon: "career.png", title: "Career"),
                      _customListTile(icon: "romance.png", title: "Romance"),
                      _customListTile(icon: "business.png", title: "Business"),
                      _customListTile(
                          icon: "education.png", title: "Education"),
                      _customListTile(icon: "health.png", title: "Health"),
                      _customListTile(
                          icon: "properties.png", title: "Properties"),
                      _customListTile(icon: "autos.png", title: "Automobiles"),
                      _customListTile(icon: "travel.png", title: "Travel"),
                      _customListTile(icon: "tech.png", title: "Tech")
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.local_fire_department_outlined,
                            color: Colors.deepOrangeAccent,
                          ),
                          Text(
                            "Trending Gist",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ],
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
                              return SizedBox(
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const ProfilePicture(
                                                url:
                                                    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80",
                                              ),
                                              const SizedBox(width: 5),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    "@user man",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Today 3:20 PM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 0,
                                                offset: Offset(3, 3))
                                          ],
                                          color: AppColors.secondary,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 12),
                                          child: Text(
                                            "Politics",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layou",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  icon: Icons.visibility,
                                                  value: "3k",
                                                  name: "views"),
                                            ],
                                          ),
                                          const Divider(),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
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
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.black, width: 3),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 0,
                                          offset: Offset(4, 4)),
                                    ]),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://static01.nyt.com/images/2022/11/13/world/13ukraine-kherson-top-01/13ukraine-kherson-top-01-mediumSquareAt3X.jpg"),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.black,
                                                        blurRadius: 0,
                                                        offset: Offset(3, 3))
                                                  ],
                                                  color: AppColors.primary,
                                                ),
                                                child: const Padding(
                                                  padding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 12),
                                                  child: Text(
                                                    "Sponsored",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: AppColors.primaryLight,
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 0,
                                                      offset: Offset(3, 3))
                                                ],
                                                color: AppColors.secondary,
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 12),
                                                child: Text(
                                                  "Politics",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              "Ukraine crisis escalates",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                              thickness: 1,
                                            ),
                                            Text(
                                              "text " * 20,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  const TextStyle(fontSize: 8),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
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

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 70,
      color: AppColors.secondary.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Town",
                    style: GoogleFonts.bebasNeue(
                        fontSize: 32, color: Colors.black),
                  ),
                  TextSpan(
                    text: "square",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 600,
            height: 40,
            child: TextFieldWidget(
              controller: TextEditingController(),
              maxLines: 1,
              textInputType: TextInputType.text,
              label: "search townsquare",
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
          SubmitButton(
            isLoading: false,
            boldText: true,
            label: "Sign Up",
            submit: () {},
            color: AppColors.primary,
          )
        ],
      ),
    );
  }
}
