# mapbox_autocomplete_search_widget

Language: [English](README.md)

MapboxAutocompleteSearchWidget is a flutter package that allows you to search for place name in a autocomplete fashion. 

Technical Notes:
The search is carried out only when search text length is greater than 2 and also a delay of 1 second is added before placing a server call. (Since user types continuously, unnessarry calls will be made to server. So we make the call with 1 second delay after user has stopped typing.)

To use this Package, Please get the Access-Token from here https://docs.mapbox.com/help/glossary/access-token/

The Package has necessarry attributions to Mapbox and can doesnot violate mapbox ![Terms and Conditions](https://www.mapbox.com/legal/tos/).

![](https://github.com/TeaTalkInternal/github_assets/blob/master/gifs/video-to-gif-converter.gif)

- [favorite_button](#favoritebutton)
  - [How to use it.](#how-to-use-it)
  - [parameters](#parameters)

##  How to use it.

the usage is very simple, just use the following
```dart
  MapboxAutocompleteSearchWidget(
      onPlaceSelected: (BuildContext context, Place place) {
        
      },
      mapboxApiKey: 'mapboxApiKey',
    ),
```

## parameters

| parameter                  | description                                                                           | default                                                                                                                                                                               |
| -------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
                                                                                        
| mapboxApiKey          | Mapbox auth-token has to be passed here                                            | This is a required parameter                                                                                                                                                    |
| onPlaceSelected                | Function that returns a context and selected Place value  from picker                                                                 | This is a required parameter                                                                                                                                                                            |


[more detail](https://github.com/TeaTalkInternal/favorite_button/tree/master/example/lib)
