import 'package:agrostack/core/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllBookings = FutureProvider<Response<dynamic>>((ref) async {
  return ref.watch(dioProvider).get('/bookings');
});

class BookingScreen extends ConsumerStatefulWidget {
  const BookingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  Text(
                    'Booking',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  // TextFormField()
                  Divider()
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.book),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Book Cool Truck',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Book a truck'),
            Expanded(
              child: ref.watch(getAllBookings).maybeMap(
                    data: (value) {
                      return (value.value.data as List<dynamic>).isNotEmpty
                          ? ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final booking = value.value.data[index];
                                return ListTile(
                                  title: Text(
                                    '${booking["firstName"]} ${booking["lastName"]}',
                                  ),
                                  subtitle: Text(
                                    "+977 ${booking["contact"]["phone"]}",
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text('No bookings found'),
                            );
                    },
                    orElse: SizedBox.new,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
