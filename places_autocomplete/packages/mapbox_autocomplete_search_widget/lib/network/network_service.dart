import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_autocomplete_search_widget/models/place.dart';
import 'package:mapbox_autocomplete_search_widget/network/network_exception.dart';
import 'package:mapbox_autocomplete_search_widget/providers/app_providers.dart';
import 'package:mapbox_autocomplete_search_widget/utils/url_constants.dart';

final networkServiceProvider =
    Provider.family.autoDispose<NetworkService, String>((ref, query) {
  // An object from package:dio that allows cancelling http requests
  final cancelToken = CancelToken();
  // When the provider is destroyed, cancel the http request
  ref.onDispose(() => cancelToken.cancel());
  final _apiKey = ref.read(apiKeyProvider).state;
  print('_apiKey $_apiKey');
  final _url = ref.read(urlConstantsProvider).getUrlForQuery(
        query: query,
        kMapBoxKey: _apiKey,
      );
  ref.maintainState = true;
  return NetworkService(dio: Dio(), url: _url);
});

class NetworkService {
  NetworkService({this.dio, this.url});

  final Dio dio;
  final String url;

  Future<List<Place>> fetchMatchingPlaces() async {
    try {
      final _response = await dio.get(url);
      if (_response.data != null) {
        final _json = jsonDecode(_response.toString());
        List<dynamic> _features = _json['features'] as List<dynamic>;
        List<Place> _placesArray = _features.map(
          (_featureMap) {
            return Place.fromMap(_featureMap);
          },
        ).toList(growable: false);
        return _placesArray;
      }
    } on DioError catch (dioError) {
      throw NetworkException.fromDioError(dioError);
    }
  }
}
