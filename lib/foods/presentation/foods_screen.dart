// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';

import 'package:agrostack/core/dio/dio_client.dart';
import 'package:agrostack/foods/infrastructure/location_serice.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const mapStyles = [
  {
    'elementType': 'geometry',
    'stylers': [
      {'color': '#212121'}
    ]
  },
  {
    'elementType': 'labels.icon',
    'stylers': [
      {'visibility': 'off'}
    ]
  },
  {
    'elementType': 'labels.text.fill',
    'stylers': [
      {'color': '#757575'}
    ]
  },
  {
    'elementType': 'labels.text.stroke',
    'stylers': [
      {'color': '#212121'}
    ]
  },
  {
    'featureType': 'administrative',
    'elementType': 'geometry',
    'stylers': [
      {'color': '#757575'}
    ]
  },
  {
    'featureType': 'administrative.country',
    'elementType': 'labels.text.fill',
    'stylers': [
      {'color': '#9e9e9e'}
    ]
  },
  {
    'featureType': 'administrative.land_parcel',
    'stylers': [
      {'visibility': 'off'}
    ]
  },
  {
    'featureType': 'administrative.locality',
    'elementType': 'labels.text.fill',
    'stylers': [
      {'color': '#bdbdbd'}
    ]
  },
  {
    'featureType': 'poi',
    'elementType': 'labels.text.fill',
    'stylers': [
      {'color': '#757575'}
    ]
  },
  {
    'featureType': 'poi.park',
    'elementType': 'geometry',
    'stylers': [
      {'color': '#181818'}
    ]
  },
  {
    'featureType': 'poi.park',
    'elementType': 'labels.text.fill',
    'stylers': [
      {'color': '#616161'}
    ]
  },
  {
    'featureType': 'poi.park',
    'elementType': 'labels.text.stroke',
    'stylers': [
      {'color': '#1b1b1b'}
    ]
  },
  {
    'featureType': 'road',
    'elementType': 'geometry.fill',
    'stylers': [
      {'color': '#2c2c2c'}
    ]
  },
  {
    'featureType': 'road',
    'elementType': 'labels.text.fill',
    'stylers': [
      {'color': '#8a8a8a'}
    ]
  },
  {
    'featureType': 'road.arterial',
    'elementType': 'geometry',
    'stylers': [
      {'color': '#373737'}
    ]
  },
  {
    'featureType': 'road.highway',
    'elementType': 'geometry',
    'stylers': [
      {'color': '#3c3c3c'}
    ]
  },
  {
    'featureType': 'road.highway.controlled_access',
    'elementType': 'geometry',
    'stylers': [
      {'color': '#4e4e4e'}
    ]
  },
  {
    'featureType': 'road.local',
    'elementType': 'labels.text.fill',
    'stylers': [
      {'color': '#616161'}
    ]
  },
  {
    'featureType': 'transit',
    'elementType': 'labels.text.fill',
    'stylers': [
      {'color': '#757575'}
    ]
  },
  {
    'featureType': 'water',
    'elementType': 'geometry',
    'stylers': [
      {'color': '#000000'}
    ]
  },
  {
    'featureType': 'water',
    'elementType': 'labels.text.fill',
    'stylers': [
      {'color': '#3d3d3d'}
    ]
  }
];

final iconProvider = FutureProvider<BitmapDescriptor>((ref) async {
  return BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(2, 2)),
    'assets/images/logo.png',
  );
});
final getAllEventsProvider = FutureProvider<Response<dynamic>>((ref) async {
  return ref.watch(dioProvider).get('/events');
});

class FoodScreen extends ConsumerStatefulWidget {
  const FoodScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FoodScreenState();
}

class _FoodScreenState extends ConsumerState<FoodScreen> {
  late GoogleMapController _googleMapController;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: 30,
      onRefresh: () async {
        ref.invalidate(getAllEventsProvider);
      },
      child: ref.watch(latLangProvider).maybeMap(
            loading: (_) => const Center(child: CircularProgressIndicator()),
            data: (data) {
              return ref.watch(getAllEventsProvider).maybeMap(
                    loading: (loading) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (response) {
                      return SafeArea(
                        child: Stack(
                          children: [
                            GoogleMap(
                              buildingsEnabled: false,
                              compassEnabled: false,
                              mapToolbarEnabled: false,
                              onTap: (position) {
                                _customInfoWindowController.hideInfoWindow!();
                              },
                              onCameraMove: (position) {
                                _customInfoWindowController.onCameraMove!();
                              },
                              markers:
                                  (response.value.data as List<dynamic>).map(
                                (e) {
                                  final latLang = LatLng(
                                    e['location']['coordinates'][0] as double,
                                    e['location']['coordinates'][1] as double,
                                  );
                                  log(e['location']['coordinates'].toString());
                                  return Marker(
                                    // infoWindow: InfoWindow(
                                    //   title: '+977 ${e["contact"]["phone"]}',
                                    //   snippet: '                ',
                                    // ),
                                    icon: ref.watch(iconProvider).value ??
                                        BitmapDescriptor.defaultMarker,
                                    onTap: () {
                                      _customInfoWindowController
                                          .addInfoWindow!(
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 5,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade800,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                title: Text(
                                                  e['title'] as String,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                                subtitle: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Text(
                                                    e['message'] as String,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                leading: const IconButton(
                                                  onPressed: null,
                                                  icon: Icon(Icons.info),
                                                ),
                                              ),
                                              const Divider(),
                                              ListTile(
                                                title: const Text('Contact us'),
                                                subtitle: Text(
                                                  '+977 ${e["contact"]["phone"]}',
                                                ),
                                                leading: const IconButton(
                                                  onPressed: null,
                                                  icon: Icon(Icons.call),
                                                ),
                                              ),
                                              const Divider(),
                                              ListTile(
                                                title: const Text(
                                                  'Food items',
                                                ),
                                                subtitle: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: (e['foodItems']
                                                            as List<dynamic>)
                                                        .map(
                                                          (e) => Chip(
                                                            label: Text(
                                                              e['name']
                                                                  as String,
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                                  ),
                                                ),
                                                leading: const IconButton(
                                                  onPressed: null,
                                                  icon:
                                                      Icon(Icons.local_dining),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        latLang,
                                      );
                                    },
                                    markerId: MarkerId(
                                      e['_id'].toString(),
                                    ),
                                    // position: data.value,
                                    // position: const LatLng(84.019588, 27.996571),
                                    position: latLang,
                                  );
                                },
                              ).toSet(),
                              onMapCreated: (controller) {
                                _customInfoWindowController
                                    .googleMapController = controller;

                                _googleMapController = controller;
                                _googleMapController
                                    .setMapStyle(json.encode(mapStyles));
                              },
                              initialCameraPosition: CameraPosition(
                                target: data.value,
                                zoom: 15,
                              ),
                            ),
                            CustomInfoWindow(
                              controller: _customInfoWindowController,
                              height: 320,
                              width: 300,
                              offset: 100,
                            ),
                            Positioned(
                              bottom: 30,
                              child: SizedBox(
                                height: 160,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(5),
                                  itemCount:
                                      (response.value.data as List<dynamic>)
                                          .length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final items =
                                        response.value.data as List<dynamic>;
                                    final latLang = LatLng(
                                      items[index]['location']['coordinates'][0]
                                          as double,
                                      items[index]['location']['coordinates'][1]
                                          as double,
                                    );
                                    return GestureDetector(
                                      onTap: () {},
                                      child: GestureDetector(
                                        onTap: () {
                                          _googleMapController.animateCamera(
                                            CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                target: latLang,
                                                zoom: 17,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade800,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          width: 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (items[index]['title'] != null)
                                                Text(
                                                  items[index]['title']
                                                      as String,
                                                ),
                                              const Divider(),
                                              ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                title: const Text('Contact us'),
                                                subtitle: Text(
                                                  '+977 ${items[index]["contact"]["phone"]}',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    orElse: SizedBox.new,
                  );
            },
            orElse: SizedBox.new,
          ),
    );
  }
}
