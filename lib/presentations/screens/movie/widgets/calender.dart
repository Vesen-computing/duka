import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/theme.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  int _selectedDayIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> generatedDays = _generateDays();
    List<Widget> calendarBlocks = [];

    for (var index = 0; index < generatedDays.length; index++) {
      var item = generatedDays[index];
      calendarBlocks.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDayIndex = index;
              selectedDay = generatedDays[index];
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: _selectedDayIndex == index
                    ? const Color(0xffe82250)
                    : Colors.grey[300],
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            item["day"],
                            style: TextStyle(
                              color: _selectedDayIndex == index
                                  ? whiteColor
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            "${item['dayNum']}",
                            style: TextStyle(
                              color: _selectedDayIndex == index
                                  ? whiteColor
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(10),
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: calendarBlocks.length,
        itemBuilder: (context, index) {
          return calendarBlocks[index];
        },
      ),
    );
  }
}
