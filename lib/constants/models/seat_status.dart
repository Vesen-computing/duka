class Seat {
  final String row;
  final int seatNumber;

  Seat({required this.row, required this.seatNumber});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Seat && other.row == row && other.seatNumber == seatNumber;
  }

  @override
  int get hashCode => row.hashCode ^ seatNumber.hashCode;
}

class SeatStatus {
  static const String Available = 'available';
  static const String Selected = 'selected';
  static const String Reserved = 'reserved';

  final String label;
  final String status;

  SeatStatus(this.label, this.status);
}
