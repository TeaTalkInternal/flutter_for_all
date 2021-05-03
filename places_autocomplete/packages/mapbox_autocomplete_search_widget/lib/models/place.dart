import 'dart:convert';

import 'package:flutter/material.dart';

class Place {
  final String id;
  final String type;
  final String text;
  final String placeName;
  final double latitude;
  final double longitude;

  Place({
    @required this.id,
    @required this.type,
    @required this.text,
    @required this.placeName,
    @required this.latitude,
    @required this.longitude,
  });

  Place copyWith({
    String id,
    String type,
    String text,
    String placeName,
    double latitude,
    double longitude,
  }) {
    return Place(
      id: id ?? this.id,
      type: type ?? this.type,
      text: text ?? this.text,
      placeName: placeName ?? this.placeName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'text': text,
      'place_name': placeName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    final center = List<double>.from(map['center']);
    final latitudeValue = (center.length > 0) ? center[0] : 0.0;
    final longitudeValue = (center.length > 1) ? center[1] : 0.0;

    return Place(
      id: map['id'],
      type: map['type'],
      text: map['text'],
      placeName: map['place_name'],
      latitude: latitudeValue,
      longitude: longitudeValue,
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Place(id: $id, type: $type,  text: $text, place_name: $placeName, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Place &&
        other.id == id &&
        other.type == type &&
        other.text == text &&
        other.placeName == placeName &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        text.hashCode ^
        placeName.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
