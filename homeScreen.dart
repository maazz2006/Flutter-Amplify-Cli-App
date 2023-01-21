import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodie_final_year_project/googlemaps.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:async';
import 'ResturantCard.dart';
import 'models/ModelProvider.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? shouldLogOut;

  const HomeScreen({super.key, this.shouldLogOut});

  @override
  State<StatefulWidget> createState() => _MyHomeScreenState();
}

// var _sugg = <Suggester>[];

// List<Suggester> _sugg = [];
// Position? _position;

// final longs = 67.09086120795679;
// final VoidCallback showMap;
// void _addGPSLocationToDB() async {
//   Suggester newPoint = Suggester(
//       resturantName: "The Stove Club",
//       address:
//           'Shop No.16, Block-6, Near Ibn-e-Sina Hospital, Gulshan-e-Iqbal, Karachi',
//       specials: "Reshmi Paneer Handi",
//       lat: '24.922901589157245',
//       long: '67.10229744232926',
//       imageUrl: 'https://gobizpk.com/uploads/1600603657906.jpg');
//   await Amplify.DataStore.save(newPoint);
// }

class _MyHomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  // var _sugg = <Suggester>[];
  List<Suggester> _sugg = List.empty(growable: true);
  List<Suggester> _searchSugg = List.empty(growable: true);

  Position? _position;

  Future? graphData;

  @override
  void initState() {
    _searchController.addListener(onSearchListener);
    graphData = readfromGraphQl();
  }
// void _addGPSLocationToDB() async {
//   Suggester newPoint = Suggester(
//       resturantName: "The Stove Club",
//       address:
//           'Shop No.16, Block-6, Near Ibn-e-Sina Hospital, Gulshan-e-Iqbal, Karachi',
//       specials: "Reshmi Paneer Handi",
//       lat: '24.922901589157245',
//       long: '67.10229744232926',
//       imageUrl: 'https://gobizpk.com/uploads/1600603657906.jpg');
//   await Amplify.DataStore.save(newPoint);
// }

  // Future<void> _addSuggToGraphQL() async {
  //   try {
  //     final sugges = Suggester(
  //         resturantName: "The Stove Club",
  //         address:
  //             'Block-6, Near Ibn-e-Sina Hospital, Gulshan-e-Iqbal, Karachi',
  //         specials: 'Reshmi Paneer Handi',
  //         lat: '24.922901589157245',
  //         long: '67.10229744232926',
  //         imageUrl: 'https://gobizpk.com/uploads/1600603657906.jpg');
  //     final request = ModelMutations.create(sugges);
  //     final response = await Amplify.API.mutate(request: request).response;

  //     Suggester? createdSugges = response.data;
  //     if (createdSugges == null) {
  //       safePrint('errors: ${response.errors}');
  //       return;
  //     }
  //     safePrint('Mutation result: ${createdSugges.resturantName}');
  //   } on ApiException catch (e) {
  //     safePrint('Mutation failed: $e');
  //   }
  // }

  Future<List<Suggester?>?> readfromGraphQl() async {
    try {
      Position position = await _determinePosition();
      // debugPrint(value);
      _position = position;
      final request = ModelQueries.list(Suggester.classType);
      final response = await Amplify.API.query(request: request).response;
      final List<Suggester?>? sugg = response.data?.items;
      if (sugg == null) {
        debugPrint('errors: ${response.errors}');
      }
      debugPrint('This function is called again');

      _sugg =
          sugg?.whereType<Suggester>().toList() ?? List.empty(growable: true);
      _searchSugg = _sugg;

      // setState(() {
      //    //_searchSugg = sugg!;
      // });

      // debugPrint(_sugg.toString());
      return sugg;
    } on ApiException catch (e) {
      debugPrint('Query failed: $e');
      return null;
    }
  }

  void onSearchListener() {
    readFromDatabaseByValue(_searchController.text);
  }

  Future<void> readFromDatabaseByValue(String value) async {
    try {
      if (value != null) {
        // value = value[0].toUpperCase() + value.substring(1);
        //   Position position = await _determinePosition();
        // debugPrint(value);
        //    _position = position;
        setState(() {
          // _sugg = await Amplify.DataStore.query(Suggester.classType, where: Suggester.SPECIALS.contains(value));
          if (value.isEmpty) {
            _searchSugg = _sugg;
          }

          _sugg.forEach((element) {
            if (element.specials.toLowerCase().contains(value.toLowerCase()))
              debugPrint('${element.specials}  matches with ${value}');
          });

          _searchSugg = _sugg
              .where((element) =>
                  element.specials.toLowerCase().contains(value.toLowerCase()))
              .toList();
        });
      }
      // return posts;
    } on DataStoreException catch (e) {
      print('Query failed: $e');
      rethrow;
    }
  }

  // Future<void> readFromDatabase() async {
  //   try {
  //     Position position = await _determinePosition();

  //     _position = position;

  //     _sugg = await Amplify.DataStore.query(Suggester.classType);
  //     debugPrint(_sugg.toString());
  //     // return posts;
  //   } on DataStoreException catch (e) {
  //     print('Query failed: $e');
  //     rethrow;
  //   }
  // }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  double distanceCalculator(var position) {
    double distance = Geolocator.distanceBetween(
        _position!.latitude,
        _position!.longitude,
        double.parse(_searchSugg[position].lat),
        double.parse(_searchSugg[position].long));

    return distance;
  }

  void handleClick(String value) {
    // shouldLogOut;
    setState(() {
      widget.shouldLogOut;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Foodie',
            style: TextStyle(fontFamily: 'Playlist', fontSize: 25),
          ),
          actions: [
            // Log Out Button
            // Padding(
            // padding: const EdgeInsets.all(8),
            // child: GestureDetector(
            //     onTap: shouldLogOut,
            //     child: const Icon(Icons.power_settings_new)),
            // ),

            PopupMenuButton<String>(
              onSelected: (choice) {
                // shouldLogOut!();
                setState(() {
                  widget.shouldLogOut!();
                });
              },
              itemBuilder: (BuildContext context) {
                return {'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              color: Colors.pink[100],
            ),
            // ElevatedButton(
            //     onPressed: _addSuggToGraphQL, child: const Text('create data'))
            // datasaver
          ],
        ),
        body: Column(children: [
          const SizedBox(
            height: 50,
            child: Padding(
              padding: EdgeInsets.only(right: 250, top: 20),
              child: Text(
                'Hello Foodie!',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Container(
                  // padding: const EdgeInsets.only(bottom: 50, left: 100),
                  width: 360,
                  height: 35,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                      color: Color.fromRGBO(249, 229, 245, 1)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 0, left: 30),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                    hintText: 'Search your taste',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      padding: const EdgeInsets.only(right: 30, bottom: 5),
                    ),
                  ),
                ),
              )
            ],
          ),
          FutureBuilder(
            future: graphData,
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.done) {
              if (!snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _searchSugg.length,
                    itemBuilder: (context, position) {
                      if ((distanceCalculator(position)) < 6000) {
                        return ResturantCard(
                          cominglist: _searchSugg[position].resturantName,
                          speciallist: _searchSugg[position].specials,
                          // speciallist:
                          // distanceCalculator(position).toString(),
                          imageurl: _searchSugg[position].imageUrl,

                          wait: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => MapSample(
                                      lat: double.parse(
                                          _searchSugg[position].lat),
                                      lng: double.parse(
                                          _searchSugg[position].long),
                                      address: _searchSugg[position].address,
                                      special: _searchSugg[position].specials,
                                      placename:
                                          _searchSugg[position].resturantName,
                                    )),
                              ),
                            );
                          },
                        );
                      } else {
                        return Text('');
                      }
                    }),
              );

              //  else {
              //   return const Padding(
              //     padding: EdgeInsets.only(top: 250),
              //     child: Center(child: CircularProgressIndicator()),
              //   );
              // }
            },
          ),
        ]));
  }
}
