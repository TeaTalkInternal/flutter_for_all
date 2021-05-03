import 'package:flutter/material.dart';
import 'package:mapbox_autocomplete_search_widget/mapbox_autocomplete_search_widget.dart';
import 'package:mapbox_autocomplete_search_widget/models/place.dart';

class ExamplePageWidget extends StatefulWidget {
  @override
  _ExamplePageWidgetState createState() => _ExamplePageWidgetState();
}

class _ExamplePageWidgetState extends State<ExamplePageWidget> {
  Place _place;
  @override
  Widget build(BuildContext context) {
    final _buttonTitle = (_place != null) ? _place.placeName : 'Search Place';
    final _textStyleColor = (_place != null) ? Colors.grey[900] : Colors.grey;
    return Scaffold(
      appBar: AppBar(
        title: Text('Places Autocomplete'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: () => _showPlacesSearchScreen(context),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _buttonTitle,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: _textStyleColor,
                    ),
                  )),
              shape: Border(
                  bottom: BorderSide(
                color: Colors.grey[400],
                width: 1.0,
              )),
            )
          ],
        ),
      ),
    );
  }

  void _showPlacesSearchScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapboxAutocompleteSearchWidget(
          onPlaceSelected: selectedPlace,
          // mapboxApiKey: 'your-mapbox-api-key',
          mapboxApiKey: 'your-mapbox-api-key',
        ),
        fullscreenDialog: true,
      ),
    );
  }

  //Here we get the place selected from our auto-complete widget;
  void selectedPlace(BuildContext context, Place place) {
    print('Place Name : ${place.placeName}');
    setState(() {
      _place = place;
    });
  }
}

/* Example using Riverpod */
/*Uncomment the following code to see the example app implemented using riverpod */
/*Add flutter_riverpod: as dependency in your app pubspec.yaml file */

/*
final placeProvider = StateProvider<Place>((ref) => null);

class ExamplePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places Autocomplete'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: () => _showPlacesSearchScreen(context),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Consumer(
                  builder: (_, watch, __) {
                    final _place = watch(placeProvider).state;
                    final _buttonTitle =
                        (_place != null) ? _place.placeName : 'Search Place';
                    final _textStyleColor =
                        (_place != null) ? Colors.grey[900] : Colors.grey;
                    return Text(
                      _buttonTitle,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: _textStyleColor,
                      ),
                    );
                  },
                ),
              ),
              shape: Border(
                  bottom: BorderSide(
                color: Colors.grey[400],
                width: 1.0,
              )),
            )
          ],
        ),
      ),
    );
  }

  void _showPlacesSearchScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapboxAutocompleteSearchWidget(
          onPlaceSelected: selectedPlace,
          mapboxApiKey:
              'pk.eyJ1Ijoia2V2aW52aXNoYWwxMSIsImEiOiJja21lN25mamUyc2p4MnBqeDg4c3M1MGhvIn0.o8vSjOwMCzAFRR3LU8Eswg',
        ),
        fullscreenDialog: true,
      ),
    );
  }

  void selectedPlace(BuildContext context, Place place) {
    print('Place Name : ${place.placeName}');
    final _placeProvider = context.read(placeProvider);
    _placeProvider.state = place;
  }
}
*/
