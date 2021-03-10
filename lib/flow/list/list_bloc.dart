import 'dart:developer';

import 'package:flutter_heroes/base/base_bloc.dart';
import 'package:flutter_heroes/network/api/list/list_api.dart';
import 'package:flutter_heroes/network/api/list/models/season_response.dart';

class ListBloc extends BaseBloc<SeasonResponse> {

  final ListApi api = ListApi();

  fetchList() async {
    try {
      postLoading();

      final season = await api.fetchSeasonList();

      if (season == null) {
        postError();
        return;
      }

      postSuccess(season);
    } catch (error) {
      log("Error list bloc $error");
      postError();
    }
  }

}