import 'dart:convert';
import 'dart:io';

import 'package:flutter_heroes/network/api/list/models/season_response.dart';
import 'package:flutter_heroes/network/base/base_api.dart';
import 'package:flutter_heroes/network/base/base_network_data.dart';
import 'package:flutter_heroes/extension/response_extensions.dart';

import 'package:http/http.dart';

class ListApi extends BaseApi {

  static const String _getListPath = "season";

  Future<SeasonResponse> fetchSeasonList() async {
    final fetchSeasonUrl = '${BaseNetworkData.baseUrl}$_getListPath';
    final seasonResponse = await _getSeason(fetchSeasonUrl);

    if (seasonResponse.isFailure()) return null;

    final seasonJson = jsonDecode(seasonResponse.body);
    final SeasonResponse seasonResponseData = SeasonResponse.fromJson(seasonJson);

    return seasonResponseData;
  }

  Future<Response> _getSeason(String url) => this.get(url);
}