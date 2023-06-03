import 'package:flutter/material.dart';

class Waktu extends StatelessWidget {
  const Waktu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int offsetWIB = 0;
    int offsetWITA = 1;
    int offsetWIT = 2;
    int offsetLondon = -6;
    DateTime timeWIB = now.add(Duration(hours: offsetWIB));
    DateTime timeWITA = now.add(Duration(hours: offsetWITA));
    DateTime timeWIT = now.add(Duration(hours: offsetWIT));
    DateTime timeLondon = now.add(Duration(hours: offsetLondon));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Time Zones',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('WIB: $timeWIB'),
            Text('\nWITA: $timeWITA'),
            Text('\nWIT: $timeWIT'),
            Text('\nLondon: $timeLondon'),
          ],
        ),
      ),
    );
  }
}
