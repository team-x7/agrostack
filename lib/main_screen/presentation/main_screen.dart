import 'dart:convert';

import 'package:agrostack/core/dio/dio_util.dart';
import 'package:agrostack/core/dio/interceptors/dio_helper.dart';
import 'package:agrostack/core/services/validation_services.dart';
import 'package:agrostack/foods/infrastructure/location_serice.dart';
import 'package:agrostack/foods/presentation/foods_screen.dart';
import 'package:agrostack/l10n/l10n.dart';
import 'package:agrostack/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    const FoodScreen(),
    // const BookingScreen(),
    const ColoredBox(color: Colors.green),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return RefreshIndicator(
      edgeOffset: 30,
      onRefresh: () async {
        ref.invalidate(getAllEventsProvider);
      },
      child: Scaffold(
        body: _screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            if (value == 1) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const AddExtraFood(),
              );
              return;
            }
            setState(() {
              currentIndex = value;
            });
          },
          unselectedItemColor: Colors.grey.shade400,
          selectedItemColor: Colors.green,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            // const BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.book,
            //   ),
            //   label: 'Booking',
            // ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.local_dining),
              label: l10n.foods,
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: Colors.green,
              ),
              label: 'Add Extra Food',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline_rounded),
              label: l10n.profile,
            ),
          ],
        ),
      ),
    );
  }
}

class AddExtraFood extends ConsumerStatefulWidget {
  const AddExtraFood({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddExtraFoodState();
}

class _AddExtraFoodState extends ConsumerState<AddExtraFood> {
  LatLng? _selectedLatLang;
  final TextEditingController _foodItemControloer = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _messageControoler = TextEditingController();

  final List<String> _items = [];
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';
  bool isLoading = false;

  void clearErrorToast() {
    setState(() {
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Add Extra Food',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                if (_errorMessage.isNotEmpty)
                  MaterialBanner(
                    content: Text(_errorMessage),
                    backgroundColor: Colors.amberAccent,
                    actions: [
                      IconButton(
                        onPressed: clearErrorToast,
                        color: Colors.black,
                        icon: const Icon(Icons.close),
                      )
                    ],
                  )
                else
                  const SizedBox(),
                TextFormField(
                  controller: _titleController,
                  validator: ValidationService.notEmpty,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _contactNumberController,
                  validator: ValidationService.notEmpty,
                  decoration: const InputDecoration(
                    hintText: 'Contact Number',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _messageControoler,
                  validator: ValidationService.notEmpty,
                  decoration: const InputDecoration(
                    hintText: 'Notes...',
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  children: _items
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Chip(
                            label: Text(e),
                            onDeleted: () {
                              setState(() {
                                _items.remove(e);
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
                TextFormField(
                  controller: _foodItemControloer,
                  onFieldSubmitted: (item) {
                    if (item.isEmpty) return;
                    setState(() {
                      _items.add(item);
                    });

                    _foodItemControloer.clear();
                  },
                  decoration: InputDecoration(
                    hintText: 'Food Items',
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_foodItemControloer.text.isEmpty) return;

                        setState(() {
                          _items.add(_foodItemControloer.text.trim());
                        });

                        _foodItemControloer.clear();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ref.watch(latLangProvider).maybeWhen(
                      data: (data) {
                        return Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GoogleMap(
                            // ignore: unnecessary_parenthesis
                            onTap: (latLang) {
                              setState(() {
                                _selectedLatLang = latLang;
                              });
                            },
                            onMapCreated: (controller) {
                              controller.setMapStyle(json.encode(mapStyles));
                            },
                            markers: Set.from(
                              [
                                Marker(
                                  draggable: true,
                                  markerId: const MarkerId('location'),
                                  position: _selectedLatLang ?? data,
                                ),
                              ].toList(),
                            ),
                            initialCameraPosition: CameraPosition(
                              target: data,
                              zoom: 15,
                            ),
                          ),
                        );
                      },
                      orElse: SizedBox.new,
                    ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_items.isNotEmpty && _selectedLatLang != null) {
                          setState(() {
                            isLoading = true;
                          });
                          final successOrFailure =
                              await ref.read(dioHelper).request(
                            reqType: DioMethod.post,
                            endpoint: '/events',
                            reqBody: {
                              'title': _titleController.text.trim(),
                              'contact': {
                                'phone': _contactNumberController.text.trim()
                              },
                              'location': {
                                'coordinates': [
                                  _selectedLatLang!.latitude,
                                  _selectedLatLang!.longitude,
                                ]
                              },
                              'message': _messageControoler.text,
                              'foodItems':
                                  _items.map((e) => {'name': e}).toList()
                            },
                          );
                          setState(() {
                            isLoading = false;
                          });
                          successOrFailure.fold(
                            (l) {
                              if (l.statusCode == 200) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Event Added successfully'),
                                  ),
                                );
                                ref.invalidate(getAllEventsProvider);
                                // ref.read(getAllEventsProvider);
                                Navigator.pop(context);
                              }
                            },
                            (r) {
                              setState(() {
                                _errorMessage = r.reason.toString();
                              });
                            },
                          );
                        }
                        // do somting
                      }
                    },
                    child: isLoading
                        ? const Text('Loading...')
                        : const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
