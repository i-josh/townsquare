import 'package:flutter/material.dart';

import '../../../values/colors.dart';

class SponsoredRow extends StatelessWidget {
  const SponsoredRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black, width: 3),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, blurRadius: 0, offset: Offset(4, 4)),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
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
                              EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          child: Text(
                            "Sponsored",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
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
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryLight,
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 0,
                              offset: Offset(3, 3))
                        ],
                        color: AppColors.secondary,
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                        child: Text(
                          "Politics",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Ukraine crisis escalates",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Text(
                      "text " * 20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 8),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
