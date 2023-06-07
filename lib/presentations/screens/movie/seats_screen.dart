

import 'package:duka/presentations/screens/movie/widgets/show_modal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/constants.dart';
import '../../../constants/models/seat_status.dart';
import '../../../constants/theme.dart';



class SeatsScreen extends StatelessWidget {
  const SeatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff2e2e2e),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Choose Seats'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: size.width * .2, horizontal: 15),
        child: Column(
          children: [
            CreateSeats(
              rows: 1,
              seatsPerRow: 6,
              reservedSeats: [
                Seat(row: 'A', seatNumber: 2),
                Seat(row: 'A', seatNumber: 5),
              ],
            ),
            const SizedBox(height: 10),
            CreateSeats(
              rows: 1,
              seatsPerRow: 6,
              reservedSeats: [
                Seat(row: 'B', seatNumber: 1),
                Seat(row: 'B', seatNumber: 4),
                Seat(row: 'B', seatNumber: 5),
              ],
            ),
            const SizedBox(height: 20),
            CreateSeats(
              rows: 1,
              seatsPerRow: 8,
              reservedSeats: [
                Seat(row: 'C', seatNumber: 2),
                Seat(row: 'C', seatNumber: 4),
                Seat(row: 'C', seatNumber: 6),
              ],
            ),
            const SizedBox(height: 10),
            CreateSeats(
              rows: 3,
              seatsPerRow: 9,
              reservedSeats: [
                Seat(row: 'D', seatNumber: 3),
                Seat(row: 'D', seatNumber: 7),
                Seat(row: 'E', seatNumber: 2),
                Seat(row: 'E', seatNumber: 8),
                Seat(row: 'F', seatNumber: 4),
                Seat(row: 'F', seatNumber: 9),
              ],
            ),
            const SizedBox(height: 18),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                DescriptionText(
                  color: Color(0xff706d76),
                  text: 'Available',
                ),
                DescriptionText(
                  color: whiteColor,
                  text: 'Reserved',
                ),
                DescriptionText(
                  color: Color(0xff4caf50),
                  text: 'Selected',
                )
              ],
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                showModal(context, size);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color(0xffe82251),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Book the Seats',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Future<dynamic> showModal(BuildContext context, Size size) {
//   return showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         height: size.height * 0.4,
//         padding: const EdgeInsets.all(14),
//         decoration: const BoxDecoration(
//             color: Color(0xff222222),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10),
//               topRight: Radius.circular(10),
//             )),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Summary',
//               style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: whiteColor),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4,
//                   childAspectRatio: 2,
//                 ),
//                 itemCount: selectedSeats.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     alignment: Alignment.center,
//                     margin: const EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       'Seat ${selectedSeats[index].row}${selectedSeats[index].seatNumber}',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Close'),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

class DescriptionText extends StatelessWidget {
  final Color color;
  final String text;
  const DescriptionText({
    required this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xff696969),
          ),
        ),
      ],
    );
  }
}

class CreateSeats extends StatefulWidget {
  final int rows;
  final int seatsPerRow;
  final List<Seat> reservedSeats;

  const CreateSeats({
    required this.rows,
    required this.seatsPerRow,
    required this.reservedSeats,
    Key? key,
  }) : super(key: key);

  @override
  _CreateSeatsState createState() => _CreateSeatsState();
}

class _CreateSeatsState extends State<CreateSeats> {
  List<List<SeatStatus>> _seatStatuses = []; // Added line

  @override
  void initState() {
    super.initState();
    _initializeSeatStatuses();
  }

  void _initializeSeatStatuses() {
    _seatStatuses = List.generate(
      widget.rows,
      (row) => List.generate(
        widget.seatsPerRow,
        (seat) {
          final seatNumber = seat + 1;
          final rowLabel = String.fromCharCode('A'.codeUnitAt(0) + row);
          final seatLabel = seatNumber.toString();
          final seatStatus = widget.reservedSeats
                  .contains(Seat(row: rowLabel, seatNumber: seatNumber))
              ? SeatStatus.Reserved
              : SeatStatus.Available;

          return SeatStatus(seatLabel, seatStatus);
        },
      ),
    );
  }

  void _toggleSeatStatus(int row, int seat) {
    setState(() {
      final currentStatus = _seatStatuses[row][seat];
      if (currentStatus.status == SeatStatus.Reserved) {
        Fluttertoast.showToast(msg: 'The seat $row-$seat is already reserved');
      } else if (currentStatus.status == SeatStatus.Available) {
        _seatStatuses[row][seat] =
            SeatStatus(currentStatus.label, SeatStatus.Selected);
        selectedSeats.add(Seat(
            row: String.fromCharCode('A'.codeUnitAt(0) + row),
            seatNumber: seat + 1));
      } else if (currentStatus.status == SeatStatus.Selected) {
        _seatStatuses[row][seat] =
            SeatStatus(currentStatus.label, SeatStatus.Available);
        selectedSeats.remove(Seat(
            row: String.fromCharCode('A'.codeUnitAt(0) + row),
            seatNumber: seat + 1));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.rows, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 15),
            ...List.generate(
              widget.seatsPerRow ~/ 2,
              (seat) {
                final currentStatus = _seatStatuses[row][seat];
                final color = currentStatus.status == SeatStatus.Reserved
                    ? Colors.white
                    : currentStatus.status == SeatStatus.Selected
                        ? Colors.green
                        : const Color(0xff706d76);

                return GestureDetector(
                  onTap: () {
                    _toggleSeatStatus(row, seat);
                  },
                  child: Icon(
                    Icons.chair,
                    size: 35,
                    color: color,
                  ),
                );
              },
            ),
            SizedBox(width: widget.seatsPerRow + 0.0),
            ...List.generate(
              widget.seatsPerRow ~/ 2,
              (seat) {
                final seatIndex = seat + widget.seatsPerRow ~/ 2;
                final currentStatus = _seatStatuses[row][seatIndex];
                final color = currentStatus.status == SeatStatus.Reserved
                    ? Colors.white
                    : currentStatus.status == SeatStatus.Selected
                        ? Colors.green
                        : const Color(0xff706d76);

                return GestureDetector(
                  onTap: () {
                    _toggleSeatStatus(row, seatIndex);
                  },
                  child: Icon(
                    Icons.chair,
                    size: 35,
                    color: color,
                  ),
                );
              },
            ),
            const SizedBox(width: 15),
          ],
        );
      }),
    );
  }
}
