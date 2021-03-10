import 'package:flutter/material.dart';
import 'package:flutter_heroes/base/http_event.dart';
import 'package:flutter_heroes/base/navigation.dart';
import 'package:flutter_heroes/components/simple_progress_bar.dart';
import 'package:flutter_heroes/flow/details/details_screen.dart';
import 'package:flutter_heroes/flow/list/components/anime_list_item.dart';
import 'package:flutter_heroes/network/api/list/models/anime.dart';
import 'package:flutter_heroes/network/api/list/models/season_response.dart';

import 'list_bloc.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key key, this.title}) : super(key: key);

  final title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListBloc _bloc;
  List<Anime> _animes;

  @override
  void initState() {
    super.initState();
    _bloc = ListBloc();
    _bloc.stream.listen(onDataChanged);
    _bloc.fetchList();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: (_animes != null)
              ? ListView.builder(
                  itemBuilder: (context, position) {
                    return InkWell(
                      child: AnimeListItem(_animes[position]),
                      onTap: () {
                        return Navigation(context)
                            .push(DetailsScreen(_animes[position]));
                      },
                    );
                  },
                  itemCount: _animes.length)
              : Center(child: SimpleProgressBar())),
    );
  }

  void onDataChanged(HttpEvent<SeasonResponse> season) {
    setState(() {
      if (season.isSuccess) {
        _animes = season.data.anime.toList();
      }
    });
  }
}
