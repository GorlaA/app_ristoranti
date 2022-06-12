import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*class page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}
*/

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Set<Marker>  _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(45.49060628897456, 8.958427513477101),
    zoom: 15,
  );

  void _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
    setState((){
      for (var i = 0; i < 5; i++) {
        _markers.add(
            Marker(
              markerId: MarkerId('id-'+i.toString()),
              position: LatLng(45.49060628897456+i, 8.958427513477101),
              infoWindow: InfoWindow(
                  title: 'Marcellino'+i.toString(),
                  snippet: 'paninaro'
              ),
            )
        );
      }
    });
  }

  /* static final CameraPosition _kLake = CameraPosition(
 *   //bearing: 192.8334901395799, //orienta la mappa a nord
 *    target: LatLng(45.382881765846086, 8.915598286593585),
 *   //tilt: 59.440717697143555, //zoom 3D
 *  zoom: 19.151926040649414);
 */

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
      ),
    );
  }
}
