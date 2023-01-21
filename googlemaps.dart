// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:foodie_final_year_project/authenticationService/auth_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final double lat;
  final double lng;
  final String placename;
  final String address;
  final String special;

  MapSample(
      {super.key,
      required this.lat,
      required this.lng,
      required this.placename,
      required this.address,
      required this.special});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
//   @override
  late GoogleMapController mapController;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.showMarkerInfoWindow(MarkerId(widget.placename));

    final marker = Marker(
      markerId: MarkerId(widget.placename),
      position: LatLng(widget.lat, widget.lng),
      // icon: await BitmapDescriptor.fromAssetImage(
      //     const ImageConfiguration(), 'assets/images/address.png'),
      infoWindow: InfoWindow(
        title: widget.placename,
        snippet: 'Recommended : ${widget.special}',
      ),
    );
    mapController.showMarkerInfoWindow(MarkerId(widget.placename));
    // print('wasdasdasd' + markers.values.toString());
    setState(() {
      markers[MarkerId(widget.placename)] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Foodie',
            style: TextStyle(fontFamily: 'Playlist', fontSize: 25),
          ),
          backgroundColor: Colors.pinkAccent[800],
        ),
        body: SizedBox(
          child: Center(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.lat, widget.lng),
                zoom: 15.0,
              ),
              markers: markers.values.toSet(),
            ),
          ),
        ),
        // ),
      );
    }
        // ),
        );
  }
}
