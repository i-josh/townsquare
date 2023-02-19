import 'package:flutter/material.dart';
import 'package:townsquare/ui/responsive/responsive_layout.dart';
import 'package:townsquare/ui/views/home/mobile/home_mobile.dart';

import 'web/home_web.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobile: HomeMobile(), web: HomeWeb());
  }
}
