import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: 37.422, longitude: -122.084),
      this.isSelecting = false});

  @override
  _MapScreenState createState() => new _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Leaflet Maps')),
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(
                  widget.initialLocation.latitude,
                  widget.initialLocation.longitude,
                ),
                minZoom: 10.0),
            layers: [
              new TileLayerOptions(
                urlTemplate: "https://api.mapbox.com/styles/v1/aldyazarya/ck55aq9y1089t1co2prpg2jsx/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWxkeWF6YXJ5YSIsImEiOiJjazUzOGg1amIwNjEyM2lvNHMzeWNhYnRxIn0.HmEgEFAvCQqtnzfcu9kMOQ",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiYWxkeWF6YXJ5YSIsImEiOiJjazUzOGg1amIwNjEyM2lvNHMzeWNhYnRxIn0.HmEgEFAvCQqtnzfcu9kMOQ',
                  'id': 'mapbox.mapbox-streets-v8',
                },
              ),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(
                      widget.initialLocation.latitude,
                      widget.initialLocation.longitude,
                    ),
                    builder: (context) => new Container(
                          child: IconButton(
                            icon: Icon(Icons.location_on),
                            color: Colors.red,
                            iconSize: 45.0,
                            onPressed: () {
                              print('Marker tapped');
                            },
                          ),
                        ))
              ])
            ]));
  }
}
