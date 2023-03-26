// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Kalender extends StatefulWidget {
  const Kalender({Key? key});

  @override
  _KalenderState createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
  DateTime _dateTime = DateTime.now();
  String _timezone = "WIB";

  void _selectTimezone(String timezone) {
    if (timezone == "WIB") {
      _dateTime = DateTime.now().toUtc().add(const Duration(hours: 7));
    } else if (timezone == "WITA") {
      _dateTime = DateTime.now().toUtc().add(const Duration(hours: 8));
    } else if (timezone == "WIT") {
      _dateTime = DateTime.now().toUtc().add(const Duration(hours: 9));
    } else {
      _dateTime = DateTime.now();
    }

    setState(() {
      _timezone = timezone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$_timezone',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectTimezone("WIB"),
              child: const Text('WIB'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () => _selectTimezone("WITA"),
              child: const Text('WITA'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () => _selectTimezone("WIT"),
              child: const Text('WIT'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        Text(
          '${_dateTime.hour}:${_dateTime.minute}:${_dateTime.second}',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: _dateTime,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            ).then((date) {
              if (date != null) {
                setState(() {
                  _dateTime = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    _dateTime.hour,
                    _dateTime.minute,
                    _dateTime.second,
                  );
                });
              }
            });
          },
          child: const Text('Pilih Tanggal'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay(
                hour: _dateTime.hour,
                minute: _dateTime.minute,
              ),
            ).then((time) {
              if (time != null) {
                setState(() {
                  _dateTime = DateTime(
                    _dateTime.year,
                    _dateTime.month,
                    _dateTime.day,
                    time.hour,
                    time.minute,
                    _dateTime.second,
                  );
                });
              }
            });
          },
          child: const Text('Pilih Waktu'),
        ),
      ],
    );
  }
}
