
import 'package:duka/presentations/screens/movie/widgets/success_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart' as route;
import '../../../../constants/theme.dart';

Future<dynamic> showModal(BuildContext context, Size size) {
  if (selectedSeats.isEmpty) {
    return Fluttertoast.showToast(msg: 'Kindly select a seat first');
  }
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: size.height * 0.4,
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          color: Color(0xff222222),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: whiteColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              DateFormat("MMM d, yyyy").format(DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  selectedDay['dayNum'])),
                              style: const TextStyle(color: whiteColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: whiteColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              selectedTime,
                              style: const TextStyle(color: whiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: whiteColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'VIP Section',
                              style: TextStyle(color: whiteColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          'Seat Numbers: ${selectedSeats.map((e) => '${e.row}${e.seatNumber}').join(', ')}',
                          style: const TextStyle(color: whiteColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Ksh: ',
                          style: TextStyle(color: whiteColor),
                        ),
                        Text(
                          '${selectedSeats.length * 450}',
                          style: const TextStyle(color: whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                successDialog(
                    context: context,
                    message: 'Your seats have been successfully booked',
                    title: 'Seats Booking',
                    success: true,
                    route: route.dashboard
                    );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffe82251),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                minimumSize: Size(size.width, 0),
              ),
              child: const Text(
                'Book Seats',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      );
    },
  );
}
