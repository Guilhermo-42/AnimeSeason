import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_heroes/base/components/image_loader.dart';
import 'package:flutter_heroes/network/api/list/models/anime.dart';

class AnimeListItem extends StatelessWidget {
  final Anime anime;

  const AnimeListItem(this.anime, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(flex: 1, child: ImageLoader(anime.imageUrl)),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                flex: 3,
                child: Text(anime.title, overflow: TextOverflow.ellipsis),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [Icon(Icons.star), Text(anime.score.toString())],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
