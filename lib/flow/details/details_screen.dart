import 'package:flutter/material.dart';
import 'package:flutter_heroes/base/components/image_loader.dart';
import 'package:flutter_heroes/network/api/list/models/anime.dart';

class DetailsScreen extends StatelessWidget {
  final Anime anime;

  const DetailsScreen(this.anime, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anime"),
      ),
      resizeToAvoidBottomInset: true,
      body: _detailsPage(),
    );
  }

  Widget _detailsPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Text(
                anime.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            ImageLoader(anime.imageUrl, heightFactor: 0.4, widthFactor: 0.7),
            Padding(padding: EdgeInsets.only(top: 10)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Episodes: " + anime.episodes.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Score: " + anime.score.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Synopsis: " + anime.synopsis,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
