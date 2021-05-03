import 'package:flutter/material.dart';
import 'package:mapbox_autocomplete_search_widget/utils/url_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchAppBarWidget extends StatefulWidget {
  const SearchAppBarWidget({
    Key key,
    @required Function searchTextDidChange,
    @required Function onValueSubmitted,
    @required TextEditingController placeNameTextController,
    @required String hintText,
  })  : _searchTextDidChange = searchTextDidChange,
        _onValueSubmitted = onValueSubmitted,
        _hintText = hintText,
        _placeNameTextController = placeNameTextController,
        super(key: key);

  final TextEditingController _placeNameTextController;
  final Function _searchTextDidChange;
  final Function _onValueSubmitted;
  final String _hintText;

  @override
  _SearchAppBarWidgetState createState() => _SearchAppBarWidgetState();
}

class _SearchAppBarWidgetState extends State<SearchAppBarWidget> {
  bool _showClearButton = false;
  @override
  void initState() {
    super.initState();
    _showClearButton = widget._placeNameTextController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final _appbarHeight = MediaQuery.of(context).size.height * 0.12;
    return Container(
      height: _appbarHeight,
      color: Colors.grey[200],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.grey[600],
          ),
          Flexible(
            child: TextField(
              controller: widget._placeNameTextController,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget._hintText,
                suffixIcon: _showClearButton
                    ? IconButton(
                        iconSize: 20.0,
                        color: Colors.grey[600],
                        onPressed: () {
                          setState(() {
                            widget._placeNameTextController.clear();
                            _showClearButton = false;
                          });
                        },
                        icon: Icon(Icons.clear_rounded),
                      )
                    : null,
              ),
              cursorColor: Colors.grey,
              onChanged: (value) {
                setState(() {
                  _showClearButton =
                      widget._placeNameTextController.text.isNotEmpty;
                });
                widget._searchTextDidChange(context, value);
              },
              onSubmitted: (value) => widget._onValueSubmitted(context, value),
            ),
          ),
          IconButton(
            icon: Icon(Icons.info_rounded),
            onPressed: () {
              //show Mapbox Attributions here
              launch(URLConstants.mapBoxAttributionURL);
            },
            color: Colors.grey[800],
          ),
        ],
      ),
    );
  }
}
