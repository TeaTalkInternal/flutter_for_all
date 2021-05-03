import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlConstantsProvider = Provider<URLConstants>((ref) {
  return URLConstants();
});

class URLConstants {
  String getUrlForQuery({String query, String kMapBoxKey}) {
    final _pathString = '/geocoding/v5/mapbox.places/$query.json';
    final url = Uri(
        scheme: 'https',
        host: 'api.mapbox.com',
        path: _pathString,
        queryParameters: {
          'access_token': '$kMapBoxKey',
          'autocomplete': 'true',
        });
    return url.toString();
  }

  static String mapBoxAttributionURL = 'https://www.mapbox.com/about/maps/';
}
