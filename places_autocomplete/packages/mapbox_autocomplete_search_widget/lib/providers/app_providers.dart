import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_autocomplete_search_widget/utils/app_constants.dart';
import 'package:mapbox_autocomplete_search_widget/models/place.dart';
import 'package:mapbox_autocomplete_search_widget/network/network_service.dart';

//Provider to save App search current State
final appStateProvider = StateProvider.autoDispose<AppState>((ref) {
  return AppState.defaultState;
});
//Provider to save current search query
final queryProvider = StateProvider.autoDispose<String>((ref) {
  ref.maintainState = true;
  return '';
});
//Provider to save current search query
final apiKeyProvider = StateProvider<String>((ref) {
  return '';
});
//Provider to save currently searched places list
final placesListProvider = StateProvider.autoDispose<List<Place>>((ref) {
  ref.maintainState = true;
  return [];
});
//Provider to create network call/ places fetch
final placesFetchProvider =
    Provider.autoDispose<Future<List<Place>>>((ref) async {
  final _query = ref.watch(queryProvider).state;
  final _networkServiceProvier = ref.watch(networkServiceProvider(_query));
  final _places = await _networkServiceProvier.fetchMatchingPlaces();
  return _places;
});
