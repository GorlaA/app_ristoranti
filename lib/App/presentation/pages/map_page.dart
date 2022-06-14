import 'dart:async';
import 'package:app_ristoranti/App/domain/test-values/Ristoranti_testing.dart';
import 'package:app_ristoranti/App/presentation/pages/home_app.dart';
import 'package:flutter/material.dart';
import 'package:app_ristoranti/App/presentation/bloc/Elementi_Home.dart';
import 'package:app_ristoranti/App/presentation/widgets/container_ristorante.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class MapProvider extends ChangeNotifier{
  bool visibleConRist = false;
  MapProvider();

  void changeContRistState(visible){
    visibleConRist = visible;
    notifyListeners();
  }
  get currentContState => visibleConRist;
}

class MapPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      color: Color.fromARGB(255, 250, 182, 80),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => MapProvider(),)
          ],
          child: Stack(
              children: [
                Expanded(
                    child: MapSample()
                ),
                TopBarPage("Mappa"),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: MostraRistorantePing(),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10))
                    ]
                ),
              ]
          ),
      ),
    );
  }
}

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
              consumeTapEvents: true,
              onTap:(){Provider.of<MapProvider>(context, listen: false).changeContRistState(true);},
              infoWindow: InfoWindow(
                  title: 'Marcellino'+i.toString(),
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
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        zoomControlsEnabled: false,
        onTap:(LatLng latLng){Provider.of<MapProvider>(context, listen: false).changeContRistState(false);},
      ),
    );
  }
}

class MostraRistorantePing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    bool visibile = Provider.of<MapProvider>(context, listen: true).currentContState;
    if(visibile)
      return Container_Ristorante(RistoTesting().getRistoranteTest);
    else
      return Container();
  }
}


