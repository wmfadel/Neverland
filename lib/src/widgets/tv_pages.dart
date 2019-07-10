import 'package:flutter/material.dart';

import '../widgets/tv_poster_page.dart';
import '../widgets/tv_intro_page.dart';
import '../widgets/tv_specs_page.dart';
import '../widgets/tv_episodes.dart';
import '../widgets/tv_seasons_page.dart';

class TVPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TVPosterPage(),
          TVIntroPage(),
          TVSpecsPage(),
          TVEpisodes(),
          TVSeasonsPage(),
        ],
      ),
    );
  }
}
