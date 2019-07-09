import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detailed_tv_provider.dart';

class TVPosterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DetailedTvProvider tvProvider =
        Provider.of<DetailedTvProvider>(context, listen: false);
    return Container(
      child: Image.network(
        'https://image.tmdb.org/t/p/w500/${tvProvider.tvDetails.poster_path}',
        fit: BoxFit.fill,
      ),
    );
  }
}
