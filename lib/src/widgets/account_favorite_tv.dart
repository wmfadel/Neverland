import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../providers/account_provider.dart';
import '../providers/authentication.dart';
import '../screens/tv_screen.dart';
import '../styles/custom_themes.dart';

class AccountFavoriteTv extends StatefulWidget {
  @override
  _AccountFavoriteTvState createState() => _AccountFavoriteTvState();
}

class _AccountFavoriteTvState extends State<AccountFavoriteTv> {
  final ScrollController scrollController = ScrollController();
  Authentication authentication;

  @override
  void initState() {
    super.initState();
    authentication = Provider.of<Authentication>(context, listen: false);
    // fetch more movies when the list reaches its end
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent)
        setState(() {
          Provider.of<AccountProvider>(context)
              .getFavoriteTvs(authentication.sessionId);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    AccountProvider provider = Provider.of<AccountProvider>(context);
    return FutureBuilder(
        future: provider.getFavoriteTvs(authentication.sessionId),
        builder: (BuildContext context, AsyncSnapshot<bool> snapShot) {
          if (provider.favoriteTv.length > 0 &&
              snapShot.data != null &&
              snapShot.data) {
            return ListView.builder(
              key: PageStorageKey('accountproviderpopulartv'),
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: provider.favoriteTv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    int id = provider.favoriteTv[index].id;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TVScreen(id)));
                  },
                  highlightColor: Theme.of(context).primaryColorDark,
                  splashColor: Theme.of(context).accentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 170,
                          height: 250,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${provider.favoriteTv[index].poster_path}',
                            width: 170,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(4),
                          width: 170,
                          height: 40,
                          child: AutoSizeText(
                            provider.favoriteTv[index].name,
                            textAlign: TextAlign.center,
                            style: CustomThemes.infoStyle,
                          ))
                    ],
                  ),
                );
              },
            );
          }

          if (snapShot.connectionState != ConnectionState.done ||
              provider.favoriteTv.length < 5) {
            // still loading data
            return Center(
              child: SpinKitWave(
                color: Theme.of(context).accentColor,
                size: 35,
              ),
            );
          }
          return Container();
        });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
