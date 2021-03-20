import 'package:flutter/material.dart';

class PlaceListPageWidget extends SearchDelegate {
  List<String> _placesArray = ['avinash', 'goa', 'limit', 'extra'];
  String selectedResult = "";
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  List<String> recentList = ["avinash", "extra"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(_placesArray.where(
            // In the false case
            (element) => element.contains(query),
          ));

    // List<String> suggestionList =

    //     _placesArray.where((element) => element.contains(query));
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(
          suggestionList[index],
        ),
        onTap: () {
          showResults(context);
        },
      ),
    );
  }
}
