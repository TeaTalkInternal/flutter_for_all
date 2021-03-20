import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:places_autocomplete/place_list_page_widget.dart';

class HomePageWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places Autocomplete'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search place name here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.grey[350],
                  ),
                ),
              ),
              onTap: () {
                showSearch(context: context, delegate: PlaceListPageWidget());
              },
            )
          ],
        ),
      ),
    );
  }
}
