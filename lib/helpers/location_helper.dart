const MAPBOX_TOKEN =
    'pk.eyJ1IjoiYWxkeWF6YXJ5YSIsImEiOiJjazUzOGg1amIwNjEyM2lvNHMzeWNhYnRxIn0.HmEgEFAvCQqtnzfcu9kMOQ';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$MAPBOX_TOKEN';
  }
}

