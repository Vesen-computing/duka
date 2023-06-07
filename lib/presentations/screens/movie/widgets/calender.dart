import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calender extends StatelessWidget {
  Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _generateDays() {
      var now = DateTime.now();
      List<Map<String, dynamic>> days = [];

      for (int i = 0; i < 6; i++) {
        var day = now.add(Duration(days: i));
        var dayName = DateFormat.E().format(day);
        days.add({"day": dayName, "dayNum": day.day, "hrs": 8});
      }
      return days;
    }

    List<Map<String, dynamic>> _generatedDays = _generateDays();
    List<Widget> _calendarBlocks = [];
    for (var item in _generatedDays) {
      _calendarBlocks.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              color: Colors.grey[300],
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(item["day"]),
                        Text("${item['dayNum']}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _calendarBlocks.length,
        itemBuilder: (context, index) {
          return _calendarBlocks[index];
        },
      ),
    );
  }
}
