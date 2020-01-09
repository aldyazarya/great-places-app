import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const MAPBOX_TOKEN =
    'pk.eyJ1IjoiYWxkeWF6YXJ5YSIsImEiOiJjazUzOGg1amIwNjEyM2lvNHMzeWNhYnRxIn0.HmEgEFAvCQqtnzfcu9kMOQ';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$MAPBOX_TOKEN';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/$lat,$lng.json?access_token=$MAPBOX_TOKEN';
    final response = await http.get(url);

    print(json.decode(response.body));
    if(json.decode(response.body)['features'] == []) {
      return 'empty address';
    }
    return json.decode(response.body)['features'][0]['place_name'];
  }
}

